## Webエンジニアのための<br>はじめてのredis
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

```shell
$ docker pull redis:latest
$ docker run -d --name rds-svr redis
$ docker run -it --link rds-svr:redis --rm redis redis-cli -h redis -p 6379
```

@[1](`docker pull redis:alpine`でも可)
@[2](redisサーバコンテナの立ちあげ)
@[3](redis-cliをコンテナ内で実行)

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

## List

* List of Strings
* Implemented with Linked List
  - insert / access to head or tail: $\mathcal{O}(1)$
  - access to mid: $\mathcal{O}(N)$
* max size: $2^{32}-1$ elems.

Note:
- $2^{32}-1$ = 約42億

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

## Hash

* String tto String map
  - Java: `HashMap<String, String>`
  - Go: `map[string]string`
* add / delete / access: $\mathcal{O}(1)$
* max size: $2^{32}-1$ pairs

Note:
- 少ないフィールドのhashはメモリ効率が良い

---

## useful commands

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

---

## Lua Scripts

* Lua 5.1 interpreter is built into redis
* using `EVAL` command
* you can issue more complex query

Note:
- from 2.6


---

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

### session token

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

---

### Real time ranking

``` python
from redis import Redis

redis = Redis()

while True:
    print('input member:score> ', end='')
    ipt = input()
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

---

## IN CONCLUSION
### redis is...

* In-Memory Key-Value Store
* Having persistency
* Having Varied data type
  - String, List, Set, Hash, SortedSet
* Try out on `try.redis.io` or official docker container
