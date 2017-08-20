# Now going with Go
## @nasa9084

---

## $ whoami

![](assets/pika.jpg)

* @nasa9084
* emacs! emacs! emacs!

---

## Golang

https://github.com/golang/go

* open source programming language
* compiled, statically typed language
* looks like C, but useful like dynamic langs
  - go is robustness and flexible

+++?image=assets/gophers.jpg

---

## go special syntaxes

+++

### iota

* use within a constant declaration
* represents successive untyped integer constants
  - reset to 0 when `const` appears
  - increments after each ConstSpec

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

+++

### defer Statement

``` go
func Bar() {
    f, _ := os.Open("hoge.txt") // _ is blank ident.
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

## testing package

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
* you can write tests **regular** go way.

+++

#### e.g.) you can write tests regular go way

``` go
func Unit(in float64) int {
    if in <= 0 {
        return 0
    }
    return 1
}

func TestUnit(t *testing.T) {
    in := 2.0
    expected := 1
    if out:= Unit(in); out != expected {
        t.Errorf("error: %d != %d", out, expected)
        return
    }
}
```

@[1-6](Unit function returns 1 if input is over 0, otherwise return 1)
@[9-10](define test values)
@[11-14](LOOK: using `if` statement, not `assume` or `equal` or so on)
@[12](if returned unexpected value, use `t.Errorf` like `fmt.Errorf`)

+++

### `testing.B`

* benchmark state and formatted benchmark log manager

``` go
func BenchmarkHoge(b *testing.B) {
    for i := 0; i < b.N; i++ {
        fmt.Println(i)
    }
}
```

@[2](b.N is adjusted until the benchmark function lasts long enough to be timed reliably)

+++

### Example Tests

* functions of the form:
  + `func ExampleXxx()`
* when ran the test, also verified example codes
  + if there's a line comment begining with "Output", the example code will ran and compared the Output

---

## `go generate`

+++

## e.g.) gen: String()

TASK: implements `Stringer` interface

``` go
type Stringer interface {
    String() string
}
```

+++

## e.g.) gen: Fruit.String()

``` go
type Fruit int

const (
    Apple Fruit = iota
    Orange
    Grape
)
```

+++

## e.g.) gen: Hand-written

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

## useful stdlibs

- HASH Algorithms: crypto/sha512, crypto/md5
- Data Encodings: encoding/json, encoding/csv
- Image Editings: image/jpeg, image/png
- HTTP Libs: HTTP Client, HTTP Server
- String Editings: strconv, strings
- Cmdline Parser: flag

---

## tools for Go

+++

### gofmt

* source code formatter for Go
  - `gofmt -w hoge.go`

* c.f.) goimports: update imports and format
  - `$ go get golang.org/x/tools/cmd/goimports`

+++

### `go vet`

* examine Go source code and reports suspicious constructs
  - uses heuristics
  - find errors not caught by the compilers

#### e.g.) unreachable code

``` go
func main() {
    fmt.Print("hello, ...")
    return
    fmt.Print("this print is unreachable")
}
```

@[0](main.go:7: unreachable code)

+++

### `godoc`

`$ go get golang.org/x/tools/cmd/godoc`

---

# ❤️GO
