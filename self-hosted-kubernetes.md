# 提案: Self-Hosted Control Plane

著者: Brandon Philips

## 動機

> コンポーネントをpod内で動かすことは、そうしなかった場合に他のものを実装しなければならなかったり、
> 可搬性が下がったり、より脆弱であったりする様な多くの問題を解決するだろうし、他の理由からこれを
> やる必要はない。完全なセルフホスティングが最終目標である。
> Brian Grant

## self-hostedとは

Self-Hosted Kubernetesはすべての必須・オプションのKubernetesコンポーネントをKubernetesそれ自体の上で動作させる。
Self-Hosted Kubernetesの利点は次の通りである:

1. 小さな依存関係: Self-Hostedでは、Kubernetesクラスタを(理想的にはコンテナ内で実行された)Kubeletにデプロイするため、
Kubernetesクラスタのためにホスト上に用意する必要があるコンポーネントを減らす必要がある。これはKubernetesの導入に係
複雑さを大幅に単純化するだろう。
2. デプロイの一貫性: Self-Hostedはディスクに書き込まれたり、設定管理システムで管理されたり、SSH経由の手作業で導入されるファイルの数を減らす。
我々の希望はホストOSに依存するパーツの数を減らし、すべての環境でのデプロイの一貫性を作ることである。
3. 内観: ユーザは`kubectl logs`の様な、既存のKubernetesのAPIを使用して内部コンポーネントのデバッグなどが出来る
4. クラスタの更新: KubernetesクラスタのコンポーネントはKubernetesのAPIによって管理されている。Kubeletの更新は新しいdaemon setsでできるし、
APIサーバの更新はdaemon setsや、将来的にはdeploymentsで出来る。アドオンのフラグはdeployments等を更新すれば変更できる。
5. HA設定が簡単: 複雑な外部ツールを使わなくても、高可用環境のスケールアップや監視が簡単にできる。

ここに、クラスタが取ることの出来るself-hostedの範囲がある。KubernetesクラスタはKubelet(level0)からアドオン(level4)の層に分割され、クラスタはすべてのレベルか、部分的にself-hostすることが出来る。

例えば、0-4 self-hostedクラスタはkubeletはdaemon setで、APIサーバはpodとして動作し、serviceとして公開されている。1-4 self-hostedクラスタはKubeletをシステムにインストールしているだろう。2-4システムはetcd以外self-hostedしている。
