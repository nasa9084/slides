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

|                   | memcached   | redis        |
|:-----------------:|:-----------:|:------------:|
| good at           | Cache       | Cache        |
| data types        | only string | varied types |
| persistency       | ×          | ○           |
| Disk I/O          | NOT DO      | can disable  |
| speed             | high        | high         |
| multi thread      | ○          | ×           |
| memory efficiency | △          | ○           |

Note:
- スレッド他院委ではmemcachedとredisは同程度の速度

---

## try out redis

+++?image=assets/docker.png

### with Docker container(official)

```
$ docker pull redis:latest
$ docker run -d --name rds-svr redis
$ docker run -it --link rds-svr:redis --rm redis redis-cli -h redis -p 6379
```

@[1](`docker pull redis:alpine`でも可)
@[2](redisサーバコンテナの立ちあげ)
@[3](redis-cliをコンテナ内で実行)

### try.redis.io

![TRY REDIS](assets/try_redis.png)

Note:
- チュートリアルも搭載

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
  - insert / access to head or tail: $O(1)$
  - access to mid: $O(N)$
* max size: $2^{32}-1$ elems.

Note:
- $2^{32}-1$ = 約42億

+++

## Set

* Set of Strings
  - un-ordered
  - no duplication
* add / delete / access avarage: $O(1)$
* max size: $2^{32}-1$ elems.

Note:
- ハッシュ表を用いて実装されている
- リサイズは同期操作
  + 巨大なセットを扱う時は注意

+++

## Sorted Set (ZSet)

* Set of Strings
  - no duplication
* each members are ordered with its score
* take score: $O(1)$
* add: $O(\log{N})$

Note:
- redisの型の内、最も特徴的
- 中間要素へのアクセスが高速

+++

## Hash

* String tto String map
  - Java: `HashMap<String, String>`
  - Go: `map[string]string`
* add / delete / access: $O(1)$
* max size: $2^{32}-1$ pairs

Note:
- 少ないフィールドのhashはメモリ効率が良い
