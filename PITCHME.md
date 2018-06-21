### コンテナ時代の監視ツール
## Prometheus入門

#### @nasa9084

---

## at first

this slide:

https://gitpitch.com/nasa9084/slides/dbas2018

+++?image=assets/image/caution.jpg

# @fa[exclamation-triangle](CAUTION!)

---

@title[whoami]
## $ whoami

![pika](assets/image/pika.png)

* @nasa9084
* 日本仮想化技術株式会社
* 自宅K8s-er
* Go / Python
* emacs! emacs! emacs!

---

## Prometheus #とは

+++

### Prometheus

* /pɹəˈmiːθi.əs/
* Google社内監視ツールBorgmonにインスパイアされたOSS
* Pull型アーキテクチャ
  * データのフォーマットを統一
    * ツリー構造ではなくフラットなデータ
* Go製

+++

#### データフォーマット

``` text
node_memory_MemTotal_bytes 1.6809955328e+10
node_memory_Active_bytes 1.031897088e+10

node_network_receive_bytes_total{device="eno1"} 7.863558737e+09
node_network_receive_bytes_total{device="eno2"} 0
node_network_receive_bytes_total{device="lo"} 2.130147354e+10
```

+++

### Prometheusの役割

0. メトリクスの収集・格納
0. クエリ(PromQL)への回答
0. アラート

---

## 選ばれる理由

* セットアップが簡単
  * 1バイナリなのでダウンロードするだけ
* 収集が簡単
  * 一般的な監視対象はExporterが提供されている
  * Exporterの実装も難しくない
* コンテナ等のスケールする基盤と相性が良い
  * Service Discovery
* 高性能
  * 数百台の監視も2C4GBで十分なくらい

Note:
* 細かい依存関係とかを考えなくて良い
* DBのセットアップも不要

---

## 使いどころ

---

## インストールの流れ(サーバ)

0. [Prometheus](https://prometheus.io/download/)をダウンロード
0. 適当なところに配置
0. 設定ファイルを書く
0. 起動する
   * systemd等でデーモン化するとよい
0. `:9090/graph`にアクセス

+++

### インストールの流れ(クライアント)

0. [Exporters and integrations](https://prometheus.io/docs/instrumenting/exporters/)からExporterを探す
0. 対象ホストでバイナリをダウンロード
0. 適当なところに配置
0. (必要なら)設定をする
0. 起動する
   * systemd等でデーモン化するとよい
0. (サービスディスカバリされない場合)サーバ側の設定に登録する

Note:
* Exporters and integrationsにない場合は自作する(後述)

+++

### 可視化

Prometheusには可視化機能は(ほぼ)ない

↓

Grafanaを使用して可視化する

e.g.) https://grafana.web-apps.tech (viewer/viewer)

---

## 注意点

---

@title[Exporterの作り方]
### Exporterの作り方(Goの場合)

+++

### 収集するメトリクスの種類を定義する

``` go
temperature = prometheus.NewDesc(
    prometheus.BuildFQName("ix2005", "", "inside_temperature"),
    "The inside temperature of IX2005.",
	[]string{"target"}, nil,
)
```

+++

### prometheus/client_golangのCollector interfaceを実装する

``` go
type Collector interface {
	Describe(chan<- *Desc)
	Collect(chan<- Metric)
}
```

+++

### Describe(chan<- *Desc)の実装

``` go
func (e *Exporter) Describe(ch chan<- *prometheus.Desc) {
    ch <- temperature
}
```

@[2](メトリクス種を登録する)

+++

### Collect(chan<- Metric)の実装

``` go
func (e *Exporter) Collect(ch chan<- prometheus.Metric) {
    // ...

    ch <- prometheus.MustNewConstMetric(
        temperature, prometheus.GaugeValue, t, "target-value",
    )

    // ...
}
```

@[4-6](メトリクス種、値種、値、ラベル値)

+++

### HTTPサーバを実装する

``` go
func main() {
	exporter, _ := NewExporter()

    // regitster your exporter
	prometheus.MustRegister(exporter)

	http.Handle("/metrics", prometheus.Handler())
    // run the HTTP server
    http.ListenAndServe(":9100", nil)
}
```


@[4-5](Collector interfaceの実装を登録)
@[7](エンドポイントを設定)
@[8-9](サーバを実行)

---

# Q?
