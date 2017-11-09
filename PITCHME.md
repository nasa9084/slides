# 最近のコマンドライン・ツール事情
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

### macOS(w/ homebrew) users:

`$ brew install peco`

### Unix or macOS(w/o homebrew) users:

download binary from https://github.com/peco/peco/releases,
and put it into your PATH

### Windows(w/ chocolatey) users:

`C:\> choco install peco`

+++

## how to use

* input which you want to filter from stdin


+++

## history-selection: in zsh

``` shell
function peco-history-selection() {
    BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/g')"
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

#### GitHub repo

`$ ghq get some/repository`

#### other repo

`$ ghq get https://some.your/repository/url`

### listup repo

`$ ghq list`

+++

## using with peco: src dir selection

``` shell
function peco-src () {
  local selected_dir=$(ghq list -p | perl -nlpe 's[.*src/(.*)][$1\0$_]' | peco --null)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

zle -N peco-src
bindkey '^S' peco-src
```
## DO YOU HAVE ANY QUESTIONS?
