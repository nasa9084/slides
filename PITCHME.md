# Now going with Go
## @nasa9084

---

## $ whoami

![](assets/pika.jpg)
* @nasa9084

---

## Golang

---

## Simple Syntax

---

## Initializer Statement

``` go
if err := Foo(); err != nil {
    // error handling
}
```

---

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
@[5](something(may include panic))
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
