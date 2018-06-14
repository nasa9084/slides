## Kubernetes #とは
### @nasa9084

---

### AT FIRST

This slide:

https://gitpitch.com/nasa9084/slides/oolforum2018

---

### $ whoami

![pika](assets/image/pika.jpg)

* @nasa9084
* 日本仮想化技術株式会社
* 自宅K8ser
* Go/Python

---

### Kubernetes #とは

![kubernetes](assets/image/kubernetes.png)

+++

#### Kubernetes (K8s)

* /k(j)uːbəˈnɛtɪs/, /k(j)uːbəˈneɪtɪs/
* コンテナオーケストレーションシステム
  * MicroService Architecture
  * コンテナノードのクラスタリング
  * 自律システム
* **抽象化基盤**

---

#### K8sを導入するメリット

* インフラの抽象化
* Infrastructure as Codeの**強制**
* Self-Healing
* Service Discovery
* Automated Rollout & Rollback
* Automated Horizontal Scale

---

##### インフラの抽象化

App Dev.「インフラはそこに有って当たり前」

↓

**Kubernetesはインフラを抽象化して提供する**

+++

###### Ingress / Service type LoadBalancer

``` yaml
kind: Service
apiVersion: v1
metadata:
  name: yourApplication
spec:
  selector:
    app: yourApplication
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
  type: LoadBalancer
```

+++

###### Deployment

``` yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus
spec:
  replicas: 1
  template:
    spec:
      containers:
        - image: prom/prometheus:v2.2.1
          name: prometheus
```

---

##### Infrastructure as Codeの強制

![deploy-yaml](assets/image/deploy.png)

---

##### Self-Healing

---

##### Service Discovery

---

##### Automated Rollout & Rollback

---

##### Automated Horizontal Scale

* CPU Based Autoscale

``` yaml
apiVersion: autoscaling/v1
kind: HorizontalPodAutoScaler
metadata:
    name: someAutoScaler
spec:
    minReplicas: 1
    maxReplicas: 10
    targetCPUUtilizationPercentage: 70
    scaleTargetRef:
        apiVersion: app/v1
        kind: Deployment
        name: someDeployment
```

---

#### DISADVANTAGES of Kubernetes

* Learning cost
  * K8s' concepts
  * about container
  * about containerizing apps
* Initial Cost
  * using on-premises is hard
    * setup
    * operations
  * **USE ON CLOUD!**
* network latency
  * VXLAN overhead(flannel)
  * iptables(too many records)

---

# Q?
