# ローカル環境でDockerをドカドカつかう
## @nasa9084

---

# this slide:
https://gitpitch.com/nasa9084/slides/pyconjp17_rejectcon

---

## $ whoami

![](assets/pika.jpg)
* nasa9084
* VirtualTech Japan Inc.
* emacs! emacs! emacs!
  * twitterができないエディタはエディタではない

+++?image=assets/builderscon.png&size=auto auto

#### 2018/09/06 - 2018/09/08

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

+++

#### 言語実行環境をコンテナ化
##### Pros:

* OSによらず一定の環境を用意できる
* パッケージなどもまとめておける
* アプリケーションごとに環境を用意できる

##### Cons:

* 実行コマンドが少し煩雑になる

+++

#### テスト環境をコンテナ化

* 手元でテストをするときにコンテナを立ちあげる
  + 毎回新環境→旧環境原因の問題が発生しにくい

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

+++

#### データベースをコンテナ化
##### Pros:

* 毎回初期状態から使える
  * 特にテストなどで有用
* 複数のデータベースを立てられる
  * 複数のアプリケーションがあっても干渉しない

##### Cons:

* 実行コマンドが煩雑になる
* 慣れないと接続方法などでハマる

---

### Container as a Command

* example: virtualtechjp/md2pdf

``` shell
$ ls
document.md
# docker run --rm -v $PWD:/workdir virtualtechjp/md2pdf
$ ls
document.md  document.pdf
```

+++

#### コマンドをコンテナ化
##### Pros:

* 実行環境の差を吸収できる
  * OSとか
  * ライブラリのバージョンとか
* 配布しやすい
  * ユーザにパッケージインストールさせるの？

##### Cons:

* 問題の特定がしにくいこともある

---

#### in Concl.

* ローカル環境でVMのごとく使用する
  * 起動が速いので便利
  * (大体の場合)問題はない
* アプリケーション単位で使用する
  * データベースとか
  * 環境をクリーンに保てる

+++

## DO YOU HAVE ANY QUESTIONS?
