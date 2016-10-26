% Introduction of Programming Language
% @nasa9084
% 2015/08/01

# Intro

----

### 自己紹介
 * 名前
    * 北村 壮大(Masahiro Kitamura)
    * HN:nasa9084  
    ![icon](./pika.jpg)

* 所属
    * 北海道大学
    * 工学部
    * 情報エレクトロニクス学科
    * コンピュータサイエンスコース

<div class="notes">
* 多分北大で一番長い学科コース名
</div>

----

### 今日の内容

* いろいろなプログラミング言語の紹介
    * 名前の紹介
        * 分類は適当
    * サンプルプログラムの紹介
        * HelloWorld
* 実際に書いてみよう
    * FizzBuzz
    * 世界のナベアツ問題

    <div class="notes">
    * いろんな分類の仕方がありすぎて複雑怪奇
    * プログラマなら一度は通る問題
    </div>

# メジャーな言語
<div class="notes">
* メジャー、何ていうのは主観でしかないけれど
</div>

----

### コンパイラ言語
<div class="notes">
* コンパイル:人間が読めるコードを、コンピュータが実行できるコードに変換する
</div>

* **C/C++**
* **Java**
* C#
* VisualBasic
* Objective-C
* Delphi/Pascal

<div class="notes">
* C#:C++とJavaを混ぜたような言語 C++より効率が良い
* VB:Windows上でのGUIプログラミングに適した言語
* O-C:C++より比較的シンプル
* Delphi:Pascalで書くVBのようなもの 結構速め てかコンパイル速度が異常に速い が、資料があまりないので実力の割に評価されてない
* Pascal:初期のMacintoshはこれで書かれていた
</div>

----

### LL (Lightweight Language)
<div class="notes">
* 習得・学習・使用が容易な言語
* 日本ではスクリプト言語を指す和製英語であるという主張もある
</div>

* **JavaScript**
* **Perl**
* **PHP**
* **Python**
* **Ruby**

----

### 関数型言語
<div class="notes">
* マイナーかも
</div>

* Haskell
* LISP
  * **Scheme**
  * Common Lisp

# マイナーな言語

----

### マイナーな汎用言語
* AWK
* Tcl/Tk
* HSP (Hot Soup Processor)
* ひまわり/**なでしこ**

<div class="notes">
* AWK:UNIXコマンドを拡張して効率的にテキストファイルを処理する
* Tcl/Tk:簡単にGUIプログラムを書ける
* HSP:日本人が作った windowsで動作 子供(小学生)向けの解説書もある
* ひまわり/なでしこ:日本語プログラミング
</div>

----

### 特殊な言語
<div class="notes">
* 特定の用途に特化した言語
</div>

* ActionScript
* Vim Script
* Emacs Lisp
* **Shell Script**
* batch File
* **TeX**

<div class="notes">
* ActionScript:Flashで複雑な動き
</div>

----

### 変態な言語/ジョークな言語
* Brainf**
* Whitespace
* **Grass**
* HQ9+
* Pxem

<div class="notes">
* Brainfuck:コンパイラがなるべく小さくなるように考案された コンパイラ:123バイト
* Whitespace:空白文字(Space,TAB,改行)だけで書かれる言語
* Grass:ちょっと草植えときますね型言語
* HQ9+:HelloWorldを最短で書ける言語
* Pxem:ファイル名もプログラムとして認識 0バイトプログラミングが可能
</div>

# C/C++

----

### Cの特徴
* 古くからある言語
    * 多分、最も使ってる人や資料が多い言語
* 割と何でもできる言語
* 単純な命令で大きなものを組み上げる
    * 他の言語は割と複雑な命令もある
* 速い

----

### HelloWorld
```c
#include <stdio.h>

int main(void){
  printf("HelloWorld\n");
  return 0;
}
```

----

### C++の特徴
* Cを拡張して作られたオブジェクト指向言語
    * ほとんどCの上位互換なのでC言語+$\alpha$的な使い方もできる
    * C(強力)の拡張なのでもちろん強力
* 難しい
* 複雑怪奇

----

### HelloWorld
```cpp
#include <iostream>

int main(){
  std::cout << "HelloWorld" << std::endl;
}
```

# Java

----

### Javaの特徴
* どのOSで書いても、どのOSでも実行できる
    * ランタイムが必要
    * Webでも使える
* オブジェクト指向
* ぬるぽ

----

### HelloWorld
```java
public class HelloWorld{
  public static void main(String[] arg){
    System.out.println("HelloWorld");
  }
}
```

# JavaScript
<div class="notes">
* このスライドもjs
* reveal.js
</div>

----

### JavaScriptの特徴
* Javaとは別物
* ブラウザ上で動作する
    * 主としてHTMLと一緒に使う
* 昔はそうでもなかった→ライブラリでWebを席巻
    * jQueryとか
    * Node.jsとか

<div class="notes">
* jQuery:より容易に記述
* Node.js:サーバサイドJavaScript環境
</div>

----

### HelloWorld
```html
<!DOCTYPE html>
 <html>
  <head>
   <title>JavaScriptテスト</title>
   <script type="text/javascript">
    document.write("HelloWorld");
   </script>
  </head>
  <body>
   <p>
   </p>
  </body>
 </html>
```

# Perl
<div class="notes">
* もともとはpearlだったが、pearlという言語が既に存在したためこの綴りとなった
* 言語仕様としては頭文字が大文字のPerl、処理系は小文字のperl
* 一応、実行前にコンパイルされる
* 次期バージョンとして設計されたPerl 6は後方互換性がないため、現在は別言語として考えられている
</div>

----

### Perlの特徴
* スクリプト言語
    * コンパイルは不要
* テキスト処理が得意
* There's mere than one way to do it.
    * 文法の自由度が高い
        * 難解
* 多用な正規表現
* cgi代表

----

### HelloWorld
```perl
#!perl
print "HelloWorld\n";
```

# PHP
<div class="notes">
* "PHP:Hypertext Preprocessor"の略
* もともとの由来は"Personal Home Page"
</div>

----

### PHPの特徴
* HTMLに埋め込む
* 文法は平易
* データベースとかが得意
* 割と速い
    * Perlに取って代わろうとしている
* 言語仕様は・・・

<div class="notes">
* MediaWiki(Wikipedia etc.)やPukiwiki、wordpressなどのオープンソースウェブアプリケーションに利用されている
* 処理系自体はCで書かれている
</div>

----

### HelloWorld
```php
class Hello{
  public static function main($args = array()){
    printf("HelloWorld");
  }
}
Hello::main()  ;
```

# Python/Ruby
<div class="notes">
* Python:英国のコメディTV番組「空飛ぶモンティ・パイソン」が由来
    * きわどいネタも多く、多くの欧米文化に影響
    * この番組の以前、当時、以後と番組をカテゴライズすることも
    * BBCは公共放送だが、王室や政治家の映像などを雑に使ったことも
* Ruby:はじめて国際電気標準会議で国際規格に認証された日本人作の言語
    * まつもとゆきひろ
    * 長らく言語仕様が明文化されなかった
</div>

----

### Pythonの特徴
* オブジェクト指向言語
* There's only one way to do it.
* インデントでブロックを記述
    * 自然とキレイに書ける
    * 読みやすい
* 入門向け
* GUIツールキットも充実
* 意外と何でも出来る
* 動作速度は・・・

<div class="notes">
* 読みやすく、効率もよいコードをなるべく簡単に
</div>

----

### HelloWorld
```python
print "HelloWorld"
```

----

### Rubyの特徴
* 日本人が作った言語
    * 日本語に強い
* オブジェクト指向言語
* Ruby on Railsで有名に
* 初心者向け
    * Pythonとよく比較される
* 多様性は善
* GUIツールキットも充実
* 意外と何でも出来る
* Windowsでは・・・

<div class="notes">
* 言語仕様策定で最も重視しているのはストレスなくプログラミングを楽しむこと
</div>

----

### HelloWorld
```ruby
print "HelloWorld\n"
```

# Scheme

----

### Schemeの特徴
* LISP系
* 言語仕様が簡潔
    * 関数型言語教育で多用

----

### HelloWorld
```scheme
(display "HelloWorld")
(newline)
```

# なでしこ

----

### なでしこの特徴
* ひまわりの進化形
    * 日本語でプログラムを書く
* 簡単（そうに見える）
    * 理解しやすい
    * 教育分野で活躍
* 意外と強い子
    * CGIやらオブジェクト指向やら
    * GUI部品やらDLLやらAPIやら

----

### HelloWorld
```
「HelloWorld」と表示。
```

# Shell Script

----

### Shell Scriptの特徴
* MacやLinuxでコマンドを実行するためのスクリプト
* 変数、条件分岐、ループ
* 最近はWindowsでも(?)

----

### HelloWorld
```bash
echo "HelloWorld"
```

# TeX

----

### Texの特徴
* 「てふ」または「てっく」
* 組版用言語
* 数式を簡単に書ける
    * 理系の論文などで多用
* しかし実はチューリング完全(C言語と同じ表現力)
    * 闇

----

### HelloWorld
```latex
\documentclass{jarticle}
\begin{document}
HelloWorld
\end{document}
```

# Grass

----

### Grassの特徴
* ちょっと草植えときますね型言語
    * 「w」「W」「v」だけ
* しかし実はすごく考えられた言語仕様
    * 才能の無駄遣い

----

### HelloWorld
```
wwvwwwWWWwwWwwWWWWwvwWWwwwWwwvwWwwwWwwvwWWwWWWWWwvwWWWwwwwWWWWwWWWWwWW
WWWWwWWWWWWWwWWWWWWWwWWWWWWWWwWwwwwwwwwvwWWWwwwwwWWWWWwWWWWWwWWWWWWWwW
WWWWWWWwWWWWWWWWWwWwwwwwwwvwWWWWwwwwwwWWWWWWwWWWWWWwWWWWWWWwWWWWWWWWWw
WWWWWWWWWwWwwwwwwwvwWWWWWwwwwwwwWWWWWWWwWWWWWWWWwWWWWWWWWwWWWWWWWWWWwW
WWWWWWWWWwWwwwwwwwvwWWWWWWWwwwwwwwwWWWWWWWWwWWWWWWWWWwWWWWWWWWWwWWWWWW
WWWWWwWwwwwwwvwWWWWWWWWwwwwwwwwwWWWWWWWWwWWWWWWWWWwWWWWWWWWWWWwWWWWWWW
WWWWwWWWWWWWWWWWWWwWwwwwwwwvwWWWWWWWWwwwwwwwwwwWWWWWWWWWwWWWWWWWWWWwWW
WWWWWWWWWwWWWWWWWWWWWWWwWwwwwwwvwWWWWWWWWWWwwwwwwwwwwwWWWWWWWWWWwWWWWW
WWWWWWwWWWWWWWWWWWWWwWwwwwwvwWWWWWWWWWWwwwwwwwwwwwwWWWWWWWWWWWWwWWWWWW
WWWWWWWwWWWWWWWWWWWWWWwWWWWWWWWWWWWWWwWWWWWWWWWWWWWWWWwWwwwwwwwvwWWWWW
WWWWWwwwwwwwwwwwwwwwwwWwwwwwwwwwwwwwwwwwwwWWWwwwwwwwwwwwwwwwwwwwWwwWWW
WWWWWWWWWWWWWWWWWwvwWWwwwwWWWwwwwwwwwwwWWWWwwwwwwwwwwWWWWWwwwwwwwwwwww
wWWWWWWwwwwwwwWWWWWWWwwwwwwwwwwwWWWWWWWWwwwwwwwwwwwwwwwwwwwwwwvwWWWWWW
WWWWWWWWWWwwwwwwwWwwvwWWWWwwwwwwwWWWWWwwwWWWWWWwwwwwwwWWWWWWWwwwwwwwwW
WWWWWWWwwwwwwwwwwwwwwWWWWWWWWWwwwwwwwwwwwwwwvwWWwWWWWWw
```

# Exercise

----

### FizzBuzz問題

#### ルール
* 1から順番に数字を出力
* 3で割り切れるときは代わりにFizz
* 5で割り切れるときは代わりにBuzz
* 両方で割り切れるなら代わりにFizzBuzz

<div class="fragment fade-in">
```
1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz
```
</div>

----

### 世界のナベアツ問題

#### ルール
* 1から順番に数字を出力
* 3の倍数または3のつく数字であれば代わりにAho

<div class="fragment fade-in">
```
1 2 Aho 4 5 Aho 7 8 Aho 10 11 Aho Aho 14 Aho 16 17 Aho 19 20 Aho 22 Aho Aho
```
</div>

----

### Sample
<div class="fragment fade-in">
C言語でのサンプルコードを紹介
</div>
<div class="fragment fade-in">
実際に皆さんにはPythonで書いてもらう
</div>

----

##### FizzBuzz
<div class="fragment fade-in">
```c
#include <stdio.h>

int main(void){
    int i, n=40;
    for(i=1; i<=n; i++){
        if(i%15==0){
            printf("FizzBuzz ");
        }else if(i%3==0){
            printf("Fizz ");
        }else if(i%5==0){
            printf("Buzz ");
        }else{
            printf("%d ", i);
        }
    }
}
```
</div>

<div class="notes">
ちゃんと説明
</div>

----

##### 世界のナベアツ問題
<div class="fragment fade-in">
```c
#include <stdio.h>

int main(void){
    int i, n=40;
    for(i=1; i<=n; i++){
        if(i%3==0 || (30<i && i<40)){
            printf("Aho ");
        }else{
            printf("%d ", i);
        }
    }
}
```
</div>

# Pythonで書いてみる

* 四則演算
* 変数
* ループ
* 分岐
* 表示
* 実行

----

### 四則演算

* `+`で足し算
* `-`で引き算
* `*`で掛け算
* `/`で割り算
* `%`で割り算の余り

----

### 変数

* 変数は箱やラベルとして説明される
* ある値に名前をつけて受け渡したり再利用したり
* 特定の数値の意味をわかりやすくするために名前をつけたり
* 変数`=`値で代入

<div class="fragment fade-in">
```python
x = 1
```
</div>

<div class="fragment fade-in">
1という値にラベルxをつけた
</div>
<div class="fragment fade-in">
または、xという名前のついた箱に1という値を入れた
</div>

----

変数`=`変数という書き方もOK

<div class="fragment fade-in">
```python
x = 1
y = x
```
</div>

<div class="fragment fade-in">
xの値は1
</div>
<div class="fragment fade-in">
yの値は代入時のxの値=1
</div>
<div class="fragment fade-in">
**xの値もyの値も1**
</div>
<div class="fragment fade-in">
このあと、xの値を変更してもyの値は変化なし
</div>

----

### ループ

* 繰り返しの処理
* 一般にはwhileとfor
* whileは条件に一致する間繰り返し
* forは特定のまとまりに対して繰り返し処理(pythonの場合)
* forは言語によって動作が違うことも多い
* 処理のまとまり(ブロック)はインデント(字下げ)で表現
* 今回はforを使う

<div class="fragment fade-in">
```python
for i in range(1,40):
    print i
```
</div>

<div class="fragment fade-in">
1以上40未満をカウントアップしながら繰り返し  
その時のカウンタの値は変数iに入れてね
</div>
<div class="fragment fade-in">
変数iの値を表示してね
</div>

----

### 条件分岐

* 条件によって実行したりしなかったり
* ifという文を使う
* 条件に一致したら実行
* 複数条件はelifで指定
* すべての条件に一致しなかった時はelseのところを実行
* elseは省略できる
* `==`(等号)や`>`,`>=`,`<`,`<=`(不等号)などが使える
* `!`(否定)も使える
* 等号の否定は`!=`

<div class="fragment fade-in">
```python
if x==1:
    print u"xは1です"
else:
    print u"xは1ではありません"
```
</div>
<div class="notes">
* 日本語文字列を表示するときはu""でくくる
</div>

----

### 表示

* 画面に表示するにはprintを使う
* 後ろに書いたもの+改行が表示される
* `,`区切りで複数のものを表示できる
* 改行されたくない時は後ろに`,`をつける

<div class="fragment fade-in">
```python
print "HelloWorld"
```
</div>

----

### 実行

source.pyという名前で保存したら、  
コマンドライン(Terminal,端末)から

```bash
$ python source.py
```

# Let's do it!

----

### 実際にやってみましょう！

<div class="fragment fade-in">
**FizzBuzz問題**

> * 3の倍数はFizz
> * 5の倍数はBuzz
> * 両方の倍数はFizzBuzz

**世界のナベアツ問題**

> * 3の倍数はAho
> * 3がつく数字もAho
</div>

# 解答例

----

### FizzBuzz問題

```python
for i in range(1,40):
    if i%15==0:
        print "FizzBuzz ",
    elif i%3==0:
        print "Fizz ",
    elif i%5==0:
        print "Buzz ",
    else:
        print i, " ",
```

----

### 世界のナベアツ問題

```python
for i in range(1,40):
    if i%3==0 or (30<i and i<40):
        print "Aho ",
    else:
        print i, " ",
```

# THANK YOU!

# ![digiporo](./digiporo_logo.png "")

