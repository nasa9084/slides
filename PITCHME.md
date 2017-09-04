# ローカル環境でDockerをドカドカつかう
## @nasa9084

---

## $ whoami

![](assets/pika.jpg)
* nasa9084
* VirtualTech Japan Inc.
* emacs! emacs! emacs!

---?image=assets/docker.png&size=auto auto

## Docker

+++

## Have you used?

+++

## Are you using?

+++

### what is Docker?

* コンテナプラットフォーム
  * ~~雑な言い方をすると~~すごいchroot
* ポータブル
  * Dockerfileやイメージ

---

## Official Python Container

``` shell
# docker run -it python
Python 3.6.2 (default, Aug 29 2017, 05:52:11)
[GCC 4.9.2] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

@[1]()
@[0]()

---

## Database Container

+++

### MySQL

``` shell
# docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -d mysql:latest
$ mysql -uroot -p -h 127.0.0.1
```

@[2](`localhost`とするとローカルのsocketに接続しようとするので注意)

+++

#### w/some local application

``` python-console
>>> import pymysql as db
>>> with db.connect("localhost", "root", "passwd") as c:
...   c.execute("show databases;")
...   r = c.fetchall()
...
>>> print(r)
(('information_schema',), ('mysql',), ('performance_schema',), ('sys',))
```

@[2](PyMySQLでは`localhost`でもOK)

+++

#### w/Commandline Client Container

``` shell
# docker run --name mymysql -e MYSQL_ROOT_PASSWORD=password -d mysql:latest
# docker run -it --link mymysql:mysql --rm mysql \
    sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" \
    -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
```

@[2](`--link`でコンテナ同士を接続)
@[3-4](環境変数に接続情報が入っている)

+++

### PostgreSQL

``` shell
# docker run -p 5432:5432 -e POSTGRES_PASSWORD=password -d postgres:latest
$ psql -h localhost -p 5432 -U postgres
```

@[2](PostgreSQLは`localhost`でも大丈夫)

---

### Container as a Command

``` shell
$ ls
document.md
# docker run --rm -v $PWD:/workdir virtualtechjp/md2pdf
$ ls
document.md  document.pdf
```

+++

#### コンテナをコマンドのように使用するメリット

* スクリプトをそのまま配布ではダメなの？
  * 実行環境の差を吸収できる
    * OSとか
      * ライブラリのバージョンとか
  * 配布しやすい
    * ユーザにパッケージインストールさせるとか・・・
