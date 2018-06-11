## Kubernetes #とは
### @nasa9084

---

### AT FIRST

This slide: https://gitpitch.com/nasa9084/slides/oolforum2018

---

### $ whoami

![pika](assets/image/pika.jpg)

* @nasa9084
* 日本仮想化技術株式会社
* 自宅K8ser
* Go/Python

---

### Kubernetes #とは

+++

#### Kubernetes (K8s)

* /k(j)uːbəˈnɛtɪs/, /k(j)uːbəˈneɪtɪs/
* コンテナオーケストレーションシステム
  * MicroService Architecture
* **抽象化基盤**

---

#### K8sを導入するメリット

* インフラの抽象化
* Infrastructure as Codeの**強制**
* Self-Healing
* Service Discovery
* Automated Rollout & Rollback
* Automated Horizontal Scale

+++

##### インフラの抽象化

App Dev.「インフラはそこに有って当たり前」

↓

**Kubernetesはインフラを抽象化して提供する**

---

##### Infrastructure as Codeの強制

![deploy-yaml](assets/image/deploy.png)

---

##### Self-Healing

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

#### K8sを導入するデメリット

* 学習コスト
* 導入が大変

---

# Q?
