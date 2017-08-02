# Now going with Go
## @nasa9084

---

## AT FIRST
## this slide:
https://gitpitch.com/nasa9084/osc17kyoto_go

---

## $ whoami

![](assets/pika.jpg)
* @nasa9084

---

## Golang

![](assets/gophers.jpg)

https://github.com/golang/go

* open source programming language
* compiled, statically typed language
* looks like C, but useful like dynamic langs
  - go is robustness and flexible

---

## Syntaxes

+++

### iota

* use within a constant declaration
* represents successive untyped integer constants
  - reset to 0 when `const` appears
  - increments after each ConstSpec

+++

#### e.g.) iota: every

``` go
const (
    a = iota // a == 0
    b = iota // b == 1
    c = iota // c == 2
    d = iota // d == 3
)
```

+++

#### e.g.) iota: can ommit

```go
const (
    a = iota // a == 0
    b        // b == 1
    c        // c == 2
    d        // d == 3
)
```

+++

#### e.g.) iota: w/bit shift

``` go
const (
    a = 1 << iota // a == 1
    b             // b == 2
    c             // c == 4
    d             // d == 8
```

+++

### Initializer Statement

``` go
if err := Foo(); err != nil {
    // error handling
}
```

@[1](exec `Foo` and bind returned value to `err`)
@[1](check the condition)
@[2](do if the condition is true)

+++

### `defer` Statement

``` go
func Bar() {
    f, _ := os.Open("hoge.txt")
    defer f.Close()

    // Something

    return
}
```

@[2](open resource)
@[5](something may include panic)
@[7](function ends)
@[3](resource is released)

---

## GOPATH

* Go load packages from $GOPATH
  - third party libs
  - my(your) projects
* $GOPATH/src/DOMAIN/USERNAME/REPO
  - e.g.) $GOPATH/src/github.com/nasa9084/myproj

+++

### `go get`

tool for download and install packages and dependencies

---

## `testing` package

* provides support for automated testing for Go packages
* run `$ go test`
  - automate exec any functions of the form:
    + `func TestXxx(*testing.T)`
* run `$go test -bench`
  - automates exec of benchmark functions of the form:
    + `func BenchmarkXxx(*testing.B)`

+++

### `testing.T`

* test state and formatted test log manager
* some useful functions

+++

### `testing.B`

---

## package document

+++

### Documentation Comment

Comments before top-level delarations are extracted as explanatory text
like:

``` go
// Compile parses a regular expression and returns, if successful,
// a Regexp that can be used to match against text.
func Compile(str string) (*Regexp, error) {
    ...
}
```

---

## `go generate`

+++

## example: String()

TASK: implements `Stringer` interface

``` go
type Stringer interface {
    String() string
}
```

+++

##  example: Fruit.String()

``` go
type Fruit int

const (
    Apple Fruit = iota
    Orange
    Grape
)
```

+++

## example: Hand-written

``` go
func (f Fruit)String() string {
    switch f {
    case Apple:
        return "Apple"
    case Orange:
        return "Orange"
    case Grape:
        return "Grape"
    default:
        panic("Unknown fruit")
    }
}
```

+++?image=assets/sad_cat.jpg

# Meh...

+++

## Lv.1: use `stringer` command

```
$ go get golang.org/x/tools/cmd/stringer
$ stringer -type=Fruit
```

+++

### Meh.
### 😞

Note:
すべての型に対して実行する必要がある

+++

## Lv.2: use automated generation

``` go
//go:generate stringer -type=Fruit
type Fruit int

const (
    Apple Fruit = iota
    Orange
    Grape
)
```

and do:

`$ go generate`

+++?image=assets/yes.jpg

# YES!

---

## The Go PlayGround
