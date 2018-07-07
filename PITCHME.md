### 最新の技術を追う
#### イマドキは如何にして構成するのか
##### @nasa9084

---

slide: https://gitpitch.com/nasa9084/slides/osc18do

---

# $ whoami

![pika](assets/image/pika.png]

* @nasa9084
* Go/Python
* emacs! emacs! emacs!

---

## cf. https://l.cncf.io

---?image=assets/image/wordcloud.png&size=contain

---

# Computing

+++

## Virtual Machines

* OpenStack
* OpenNebula

* Amazon Web Services (AWS)
* Microsoft Azure
* Google Cloud Platform (GCP)

+++

### OpenStack

* web: [www.openstack.org](https://www.openstack.org)
* GitHub: [openstack/*](https://github.com/openstack/)
* OSS for creating private and public clouds
* microservice architecture
* OpenStack API + AWS compatible API
* Python
* 2 servers〜

+++

### OpenNebula

* web: [opennebula.org](https://opennebula.org)
* GitHub: [OpenNebula/one](https://github.com/OpenNebula/one)
* Simple yet Powerful Solution to Build Clouds
* monolithic architecture
* C++/Ruby
* 1 server〜

+++

## Containers

* Kubernetes (k8s)
* container runtimes
  * Docker / moby project
  * containerd

+++

### Kubernetes (k8s)

* web: [k8s.io -> kubernetes.io](https://k8s.io)
* GitHub: [kubernetes/kubernetes](https://github.com/kubernetes/kubernetes)
* Container Orchestration system
* microservice architecture
* Go
* 2 servers〜

+++

### Docker / moby project

* web: [www.docker.com](https://www.docker.com)
* GitHub: [moby/moby](https://github.com/moby/moby)
* OSS container platform
* server-client architecture
* Go

+++

### containerd

* web: [containerd.io](https://containerd.io)
* GitHub: [containerd/containerd](https://github.com/containerd/containerd)
* an industry-standard container runtime
* server-client architecture
* Go

---

# Databases
## KVS

* Redis
* etcd

+++

### Redis

* web: [redis.io](https://redis.io)
* GitHub: [antirez/redis](https://github.com/antirez/redis)
* in-memory key-value store that persists on disk
* C

+++

### etcd

* web: [coreos.com/etcd](https://coreos.com/etcd)
* GitHub: [coreos/etcd](https://github.com/coreos/etcd)
* A distributed, reliable key-value store
  * for distributed systems
* Go
* based on Raft algorithm

---

# Monitoring

+++

## Metrics

* ZABBIX
* Prometheus

+++

### ZABBIX

* web: [www.zabbix.com](https://www.zabbix.com)
* GitHub: [zabbix/zabbix](https://github.com/zabbix/zabbix)
* C, PHP

+++

### Prometheus

* web: [prometheus.io](https://prometheus.io)
* GitHub: [prometheus/prometheus](https://github.com/prometheus/prometheus)
* a systems and service monitoring system
* Pull metrics from targets
* Go
* used with Grafana

+++

### Grafana

* web: [grafana.com](https://grafana.com)
* GitHub: [grafana/grafana](https://github.com/grafana/grafana)
* The platform for beautiful analytics and monitoring
* many datasources
  * Prometheus
  * AWS CloudWatch
  * Azure Monitor
  * RDB(PostgreSQL)
  * DataDog
* Go

+++

## Logs

* ELK stack
  * elasticsearch
  * LogStash
  * Kibana
* EFK stack
  * elasticsearch
  * fluentd
  * Kibana

+++

### elasticsearch

* web: [www.elastic.co/products/elasticsearch](https://www.elastic.co/products/elasticsearch)
* GitHub: [elastic/elasticsearch](https://github.com/elastic/elasticsearch)
* a distributed, RESTful search and analytics engine
* Java

+++

### LogStash

* web: [www.elastic.co/products/elasticsearch](https://www.elastic.co/products/elasticsearch)
* GitHub: [elastic/logstash](https://github.com/elastic/logstash)
* transport and process your logs, events, or other data
* Java

+++

### fluentd

* web: [www.fluentd.org](https://www.fluentd.org)
* GitHub: [fluent/fluentd](https://github.com/fluent/fluentd)
* an open source data collector for unified logging layer
* Ruby

+++

### Kibana

* web: [www.elastic.co/jp/products/kibana](https://www.elastic.co/jp/products/kibana)
* GitHub: [elastic/kibana](https://github.com/elastic/kibana)
* analytics and search dashboard for Elasticsearch
* Node.js

---

# Automation

+++

## Infrastructure

* Ansible
* Terraform

+++

### Ansible

* web: [www.ansible.com](https://www.ansible.com)
* GitHub: [ansible/ansible](https://github.com/ansible/ansible)
* a radically simple IT automation system
* agentless automated setup using SSH
* Python

+++

### Terraform

* web: [www.terraform.io](https://www.terraform.io)
* GitHub: [hashicorp/terraform](https://github.com/hashicorp/terraform)
* a tool for building, changing, and versioning infra
* Go

---

# Development

+++

## Spec definition

* Swagger
* OpenAPI Specification
* Protocol Buffers / gRPC
* GraphQL

+++

## CI/CD

* Jenkins / JenkinsX
* Spinnaker

* travis CI
* circleCI

---

# Q?
