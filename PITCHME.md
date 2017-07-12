## First Redis<br>for Web Engineers
### @nasa9084

---

### this slide
https://gitpitch.com/nasa9084/slides/osc17do

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

* <span style="color: #c6302b;">RE</span>mote <span style="color: #c6302b;">DI</span>ctionary <span style="color: #c6302b;">S</span>erver
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

```shell
$ docker pull redis:latest
$ docker run -d --name rds-svr redis
$ docker run -it --link rds-svr:redis --rm redis redis-cli -h redis -p 6379
```

@[1](it's ok: `docker pull redis:alpine`)
@[2](run redis server container)
@[3](exec redis-cli command line tool)

+++

### try.redis.io

![TRY REDIS](assets/try_redis.png)

Note:
- チュートリアルも搭載

+++

## HELP

* you can use `HELP` command
  - help for specific command: `HELP COMMAND`
  - help for command group: `HELP @<GROUP>`
    + e.g.) `HELP @generic`

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

### COMMANDS

* `SET key value` / `GET key`
* `APPEND key value`
* `INCR key` / `INCRBY key increment`
  - Increment the integer value of a key
* `STRLEN key`
  - Get the length of string
* `BITOP operation destkey key [key...]`
  - Perform bitwise operations between strings

Note:
- `AND` / `OR` / `XOR` / `NOT`が使える

+++

## List

* List of Strings
* Implemented with Linked List
  - insert / access to head or tail: $\mathcal{O}(1)$
  - access to mid: $\mathcal{O}(N)$
* max size: $2^{32}-1$ elems.

Note:
- $2^{32}-1$ = 約42億

+++

### COMMANDS

* `LPUSH key value(s)` / `RPUSH key value(s)`
  - Prepend value / append value
* `LLEN key`
  - Get the length of list
* `LPOP key`
  - Remove and return first elem of list
* `RPOPLPUSH source destination`
  - Remove and return last elem of source list and prepend it to destination list

+++

## Set

* Set of Strings
  - un-ordered
  - no duplication
* add / delete / access avarage: $\mathcal{O}(1)$
* max size: $2^{32}-1$ elems.

Note:
- ハッシュ表を用いて実装されている
- リサイズは同期操作
  + 巨大なセットを扱う時は注意

+++

### COMMANDS

* `SADD key member(s)`
* `SCARD key`
  - Get the number of members in a set
* `SDIFF key(s)` / `SINTR key(s)` / `SUNION key(s)`
  - Subtract / Intersect / Union
* `SISMEMBER key value`
  - Determine if a given value is a member of a set

+++

## Sorted Set (ZSet)

* Set of Strings
  - no duplication
* each members are ordered with its score
* take score: $\mathcal{O}(1)$
* add: $\mathcal{O}(\log{N})$

Note:
- redisの型の内、最も特徴的
- 中間要素へのアクセスが高速

+++

### COMMANDS

* `ZADD key score member`
* `ZRANK key member`
  - Determine the index of a member in a sorted set

Note:
- ListやSetと同様のこともだいたいできる

+++

## Hash

* String to String map
  - Java: `HashMap<String, String>`
  - Go: `map[string]string`
* add / delete / access: $\mathcal{O}(1)$
* max size: $2^{32}-1$ pairs

Note:
- 少ないフィールドのhashはメモリ効率が良い

+++

### COMMANDS

* `HSET key field value`
* `HGETALL key`
  - Get all the fields and values in a hash
* `HVALS key`
  - Get all the values in a hash

Note:
- 二重になっているだけで、Stringと同様の操作ができる

---

## other feature

+++

### Geo commands

* `GEOADD key longitude latitude member`
  - Add geospatial items in the geospatial index represented
* `GEODIST key member1 member2`
  - Returns the distance between two members of a geospatial index
* `GEORADIUS key longitude latitude radius m|km|ft|mi`
  - Query to fetch members matching a given maximum distance from a point

Note:
- 3.2.0から追加
- 内部的にはsorted set
- 緯度経度に制限あり
  + 妥当な経度は、-180°〜180°
  + 妥当な緯度は、-85.05112878°〜85.05112878°


+++

### EXPIRES

* `EXPIRE key seconds`
  - set a timeout on key
  - the key will auto-deleted after given seconds
* `EXPIREAT key timestamp`
  - the key will auto-deleted at given time

+++

### RAMDOMKEY

* `RANDOMKEY`
  - returns a random key
  - $\mathcal{O}(1)$

+++

## Lua Scripts

* Lua 5.1 interpreter is built into redis
* using `EVAL` command
* you can issue more complex query

Note:
- from 2.6

+++

## redis security

https://redis.io/topics/security

* Protected Mode(default)
  - only replies to from loopback interface
* Disable some command
  - `rename-command`
* Authentication feature
  - `AUTH`

Note:
- 予想できない任意の名称にするか空文字列に当てる
- AUTHも暗号化されないので注意(ただの冗長化レイヤ)

---

## Usecases

+++

#### session token

``` python
from redis import Redis
from uuid import uuid4

class User:
    # ... some member variables
    def generate_token(self):
        redis = Redis(host='localhost', port=6389)
        if redis.exists(self.token):
            return self.token
        new_token = str(uuid4())
        ttl = 10 * 60 * 60 # 10 minutes
        redis.setex(new_token, self.name, ttl)
        self.token = new_token
        return self.token
```

@[1](`$ pip install redis`)
@[7](configure connection)
@[8-9](check key existential)
@[11](TTL unit is `seconds`)
@[12](set new key-value with expire)

+++

#### Real time ranking

``` python
while True:
    ipt = input('input member:score> ')
    if ipt == 'show':
        ranking = redis.zrange('ranking:', 0, 5, withscores=True)[::-1]
        for i, m in enumerate(ranking):
            values = {
                'rank': i + 1,
                'member': m[0].decode(),
                'point': m[1]
            }
            print('{rank}: {member} ({point}pt)'.format(**values))
        continue
    member, score = args.split(':')
    redis.zadd('ranking', member, int(score))
print('good bye')
```

@[0](import and definition is omitted)
@[4](`ZRANGE key start end [WITHSCORES]`)
@[14](add to sorted set)
@[0](https://gist.github.com/nasa9084)

---

## IN CONCLUSION
### redis is...

* In-Memory Key-Value Store
* Having persistency
* Having Varied data type
  - String, List, Set, Hash, SortedSet
* Try out on `try.redis.io` or official docker container
