## First Redis<br>for Web Engineers
### @nasa9084

---

### this slide
https://gitpitch.com/nasa9084/slides/osc17kyoto_redis

---

## $ whoami
### @nasa9084
![ICON](assets/pika.jpg)

---?image=assets/redis_background.png

# redis

+++

## DO YOU KNOW REDIS?

+++

# 🤔

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

### Sample

``` python
from redis import Redis

redis = Redis()
redis.set('hoge', 'fugafuga')
print(redis.get('hoge')) #=> b'fugafuga'

redis.set('point', 10)
print(redis.get('point')) #=> b'10'
redis.incr('point')
print(redis.get('point')) #=> b'11'
```

@[3](default connection: localhost:6379)
@[4](`SET hoge fuga`)
@[5-6](`GET hoge`: return bytes)
@[7](`SET point 10`)
@[8](`GET point`: return **bytes**)
@[9](`INCR point`: increment `point`)
@[10](returned value is incremented)

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

### Sample

``` python
from redis import Redis

redis = Redis()
redis.rpush('piyo', 1, 2, 3)
print(redis.lrange('piyo', 0, -1))
#=> [b'1', b'2', b'3']
print(redis.lpop('piyo'))
#=> b'1'
print(redis.lrange('piyo', 0, -1))
#=> [b'2', b'3']
```

@[4](`RPUSH piyo 1 2 3`)
@[5-6](`LRANGE piyo 0 -1`: return list of bytes<br>-1 means 'last index')
@[7-8](`LPOP piyo`: return bytes)
@[9-10](1 is removed)

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
* `SDIFF key(s)` / `SINTER key(s)` / `SUNION key(s)`
  - Subtract / Intersect / Union
* `SISMEMBER key value`
  - Determine if a given value is a member of a set

+++

### Sample

``` python
from redis import Redis

redis = Redis()
redis.sadd('foo', 1, 3, 5)
print(redis.smembers('foo'))
#=> {b'3', b'5', b'1'}
redis.sadd('foo', 1)
print(redis.smembers('foo'))
#=> {b'3', b'5', b'1'}
redis.sadd('bar', 5, 10, 15)
print(redis.sinter('foo', 'bar'))
#=> {b'5'}
```

@[4](`SADD foo 1 3 5`)
@[5-6](`SMEMBERS foo`: return set of bytes)
@[7](`SADD foo 1`)
@[8-9](1 is not added)
@[10](`SADD bar 5 10 15`)
@[11-12](`SINTER foo bar`: return intersect set)

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

### Sample

``` python
from redis import Redis

redis = Redis()
redis.zadd('bar', 'ham', 20)
redis.zadd('bar', 'egg', 10)
redis.zadd('bar', 'spam', 30)
print(redis.zrange('bar', 0, -1))
#=>[b'egg', b'ham', b'spam']
```

@[4](`ZADD bar ham 20`)
@[5](`ZADD bar egg 10`)
@[6](`ZADD bar spam 30`)
@[7-8](return list sorted by score)

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

+++

### Sample

``` python
from redis imort Redis

redis = Redis()
redis.hset('status', 404, 'Not Found')
print(redis.hgetall('status'))
#=>{b'404': b'Not Found'}
add_dict = {
    200: 'OK',
    500: 'Internal Server Error'
}
redis.hmset('status', add_dict)
print(redis.hkeys('status'))
#=>[b'404', b'200', b'500']
print(redis.hget('status', '200'))
#=>b'OK'
```

@[4](`HSET status 404 "Not Found"`)
@[5-6](`HGETALL status`: return dict(key and value is bytes))
@[7-10](define dict)
@[11](`HMSET status 200 OK 500 "Internal Server Error"`)
@[12-13](`HKEYS status`: return list of keys)
@[14-15](`HGET status 200`: return bytes)

---

## other feature

+++

### Geo commands🌎

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

# Do you have any questions?

+++

# THANK YOU!
