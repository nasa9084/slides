# about minio

---

slide: https://gitpitch.com/nasa9084/slides/rancherjp15

---

### $ whoami

![pika](assets/image/pika.png)

* @nasa9084

---

### Do you know Object Storage?

---

### Do you know S3?

---

### Do you know minio?

---

### minio is...

* an open source object storage server
  * AWS S3 compatible
* you can run standalone, or distributed
  * Highly Available
  * can tolerate up to (N/2)-1 node failures
* designed as "deployed once and forgotten"
* written in Golang
* https://minio.io/

---

### How to setup minio (standalone)

``` shell
$ wget https://dl.minio.io/server/minio/release/linux-amd64/minio
$ chmod +x minio
$ ./minio server /mnt/data
```

---

### How to setup minio (cluster)

![servers](assets/image/distributed_minio.png)

+++

``` shell
$ wget://dl.minio.io/server/minio/release/linux-amd64/minio
$ chmod +x minio
$ ./minio server http://192.168.1.1{1...4}/export
```

for all server (>=4 servers)

---

# NO SLIDES

---

# Q?
