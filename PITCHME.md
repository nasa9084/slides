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
* VirtualTech Japan Inc.
* on-home K8s-er
* Go/Python

---

### WHAT IS Kubernetes?

![kubernetes](assets/image/kubernetes.png)

+++

#### Kubernetes (K8s)

* /k(j)uːbəˈnɛtɪs/, /k(j)uːbəˈneɪtɪs/
* distributed container orchestration system
  * infrastructure for containerized applications
  * MicroService Architecture
  * container node clustering
  * Autonomous system
* **Abstraction Environment**

---

#### ADVANTAGES of Kubernetes

* Abstract Infrastructure
* Force Infrastructure as Code
* Self-Healing
* Service Discovery
* Automated Rollout & Rollback
* Automated Horizontal Scale

---

##### Abstract Infrastructure

App Dev. "Infrastructures are given."

↓

**Kubernetes abstracts the infrastructures**

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

##### force Infrastructure as Code

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
