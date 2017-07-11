## Webエンジニアのための<br>はじめてのredis
### @nasa9084

---

## $ whoami
### @nasa9084
![ICON](assets/pika.jpg)

---?image=assets/redis_background.png

# redis

+++

## DO YOU KNOW REDIS?

+++

## what is "redis"?

* REmote DIctionary Server
* a kind of Key-Value Store (KVS)
  - **Varied Data Structure**
* In-Memory
  - **Having  persistence**
* Easy and Fast
* Compatible w/Python, Ruby, and so on

<span style="color: #e49436;" class="fragment">web engineers should learn redis!</span>

Note:
* BSD license
* implemented with C
* latest stable version is 3.2.9

+++

## Key-Value Store (KVS)
### LIKE...

* dict (Python)
* hash (Perl, Ruby)
* map(C++, Java, Go)
* namespaces

+++

## Comparison with RDBMSs

| Function                | RDBMS | Redis |
|:-----------------------:|:-----:|:-----:|
| using simply            | △    | ◎    |
| high speed processing   | △    | ◎    |
| horizontal distribution | ×    | ◎    |
| high availability       | △    | ◎    |
| persistency             | ◎    | ○    |
| complex query           | ◎    | ×    |
| transaction             | ◎    | △    |
| consistency             | ◎    | △    |
