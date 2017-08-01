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

---

## Syntaxes

+++

## Initializer Statement

``` go
if err := Foo(); err != nil {
    // error handling
}
```

@[1](exec `Foo\(\)` and bind returned value to `err`)
@[1](check the condition)
@[2](do if the condition is true)

`err` is local variable in `if` statement

+++

## `defer` Statement

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

---

## The Go PlayGround
