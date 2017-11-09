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

### Windows users:

`C:\> choco install peco`

+++

## history-selection

``` shell
function peco-history-selection() {
    BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/g')"
    zle clear-screen
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
```

---

## DO YOU HAVE ANY QUESTIONS?
