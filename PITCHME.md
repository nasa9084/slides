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

#### compare with RDBSMSs

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

Note:
- クラスタリングをネイティブサポートしている
- マスター・スレーブ構成をサポート

+++

#### compare with memcached

|                   | memcached   | redis            |
|:-----------------:|:-----------:|:----------------:|
| good at           | Cache       | Cache            |
| data structure    | only string | varied structure |
| persistency       | ×          | ○               |
| Disk I/O          | NOT DO      | can be disable   |
| speed             | high        | high             |
| multi thread      | ○          | ×               |
| memory efficiency | △          | ○               |

Note:
- スレッド他院委ではmemcachedとredisは同程度の速度

---

## Redis Data Type

Note:
- memcachedと比較して方が多いのがredisの特徴

+++

## String

* String
  - replace
  - get length
* Number
  - `INCR` / `DECR`
* max: 512MB
* Binary Safe
  - you can insert pictures

Note:
- 最も基本の型

+++

## List

* List of Strings
* Implemented with Linked List
  - insert / access to head or tail: $$O(1)$$
  - access to mid: $$O(N)$$
* max size: $$2^{32}-1$$ elems.
