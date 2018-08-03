## 入門Kubernetes
### @nasa9084

---

### AT FIRST

This slide:

https://gitpitch.com/nasa9084/slides/osc18kyoto

---

### $ whoami

![pika](assets/image/pika.jpg)

* @nasa9084
* VirtualTech Japan Inc.
* on-home K8s-er
* Go/Python

+++

#### myhome k8s

![infra](assets/image/my_infra.png)

---

### WHAT IS Kubernetes?

![kubernetes](assets/image/kubernetes.png)

+++

#### Kubernetes (K8s)

* /k(j)uːbəˈnɛtɪs/, /k(j)uːbəˈneɪtɪs/
* distributed container orchestration system
  * infrastructure for containerized applications
  * microservice architecture
  * container node clustering
  * autonomous system
  * immutable infrastructure
  * declarative
* **abstraction environment**

---

#### ADVANTAGES of Kubernetes

* abstract infrastructure
* force Infrastructure as Code
* self-healing
* service discovery
* automated rollout & rollback
* automated horizontal scale

+++

##### abstract infrastructure

* e.g.: Service type LoadBalancer

``` yaml
apiVersion: v1
kind: Service
metadata:
  name: example
spec:
  type: LoadBalancer
  selector:
    app: example
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

+++

![type LoadBalancer](assets/image/typeloadbalancer.png)

+++

##### self-healing

* Liveness Probe
  * check application health
    * HTTP GET
    * Exec command
  * kill container if not healthy
    * K8s will make a new app container

---

### HOW-TO build

* Public Clouds
  * GCP-GKE, AWS-EKS, Azure-AKS
* On-Prem
  * kubeadm, kubespray, juju/MAAS, Rancher/RKE
  * the hard way
* Localhost
  * minikube, Docker for Mac/Windows

---

### resources

* Pod
* Deployment
* DaemonSet
* Service
* ConfigMap
* PersistentVolume

Note:
* Secret
* Job

---

### tools

* kustomize
* kubectx/kubens
* stern

---

# Q?
