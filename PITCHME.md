## 最近のコマンドライン・ツール事情
## @nasa9084

---

## $ whoami

![](assets/pika.jpg)
* nasa9084
* VirtualTech Japan Inc.
* emacs! emacs! emacs!

---

# peco

* by @lestrrat, written in Go
* interactive filtering tool
* like helm (namespace is conflicted!)
* incremental search
* select multiple line

NOTE:
* not kubernetes helm

+++

## installation

#### macOS(w/ homebrew) users:

`$ brew install peco`

#### Unix or macOS(w/o homebrew) users:

download binary from GitHub(peco/peco),
and put it into your PATH

#### Windows(w/ chocolatey) users:

`C:\> choco install peco`

+++

## how to use

* input which you want to filter from stdin


+++

## history-selection

in .zshrc,

``` shell
function peco-history-selection() {
    BUFFER="$(history -nr 1 | awk '!a[$0]++' |\
    peco --query "$LBUFFER" | sed 's/\\n/\n/g')"
    zle clear-screen
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
```

---

# ghq

* by @metemen, written in Go
* remote repository clones management tool
* having good compatibility with GOPATH

+++

## installation

`$ go get https://github.com/motemen/ghq`

+++

## how to use ghq

### get repo

`$ ghq get some/repository`

or,

`$ ghq get https://some.your/repository/url`

### listup repo

`$ ghq list`

+++

## using with peco
#### src dir selection

``` shell
function peco-src () {
  local selected_dir=$(ghq list -p |\
  perl -nlpe 's[.*src/(.*)][$1\0$_]' | peco --null)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

zle -N peco-src
bindkey '^S' peco-src
```

---

# hub

* by GitHub, written in Go
* extend `git` command

+++

## installation

#### macOS(w/ homebrew) user

`$ brew install hub`

#### windows(w/ chocolatey) user

`C:\> choco install hub`

#### fedora user

`# dnf install hub`

#### other user

download binary from GitHub(github/hub)

+++

## prepare hub

#### Unix user

put into your .bashrc or .zshrc:

`eval "$(hub alias -s)"`

#### windows user

do on powershell:

``Add-Content $PROFILE "`nSet-Alias git hub"``

+++

## how to use hub

you can use as same as `git` command, and some GitHub integrations are added.

* `$ git create`
    - create repository on GitHub
* `$ git pull-request`
    - open a pull req on GitHub
* `$ git ci-status`
    - show CI status of a commit

+++

## BONUS: gitignore.io

https://www.gitignore.io

* generates .gitignore for your lang, your os

---

# anyenv

* by riywo, written in shell
* wrapper for **env

+++

## installation

``` shell
$ git clone https://github.com/riywo/anyenv ~/.anyenv
$ echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.your_profile
$ echo 'eval "$(anyenv init -)"' >> ~/.your_profile
$ exec $SHELL -l
```

+++

## how to use

``` shell
$ anyenv install pyenv
$ exec $SHELL -l
$ pyenv install 3.6.0
$ pyenv global 3.6.0 # enable python 3.6.0
```

+++

## **envs

* erlenv: Erlang
* goenv: Go
* jenv: Java
* ndenv: Node.js
* plenv: Perl
* pyenv: Python
* rbenv: Ruby
* scalaenv: Scala
* swiftenv: Swift

and more!

---

# direnv

* written in Go
* environment switcher

+++

## installation

download from https://github.com/direnv/direnv/releases

or install w/ package manager:

+++

## prepare

put into your profile:

##### BASH

`eval "$(direnv hook bash)"`

##### ZSH

`eval "$(direnv hook zsh)"`

##### FISH

`eval (direnv hook fish)`

##### TCSH

``eval `direnv hook tcsh` ``

+++

## how to use

``` shell
$ echo export FOO=foo > .envrc
$ direnv allow .
```

---

# DEMO

---

## DO YOU HAVE ANY QUESTIONS?
