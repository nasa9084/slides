# コンテナ時代の監視ツール Prometheus入門

---

## $ whoami

![pika](assets/image/pika.png)

* @nasa9084
* 日本仮想化技術株式会社
* 自宅K8s-er
* Go / Python
* emacs! emacs! emacs!

---

## Prometheus #とは


---

## 選ばれる理由

* 収集簡単
* 柔軟
* コンテナと相性がよい
* 自動化（ansible等）と相性がよい

---

## 使いどころ

---

## インストールの流れ

0. [Prometheus](https://prometheus.io/download/)をダウンロード
0. 適当なところに配置
0. 設定ファイルを書く
0. 起動する
   * systemd等でデーモン化するとよい

---

## 注意点

---

## Exporterの作り方(Goの場合)

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
