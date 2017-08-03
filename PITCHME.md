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

https://github.com/golang/go

* open source programming language
* compiled, statically typed language
* looks like C, but useful like dynamic langs
  - go is robustness and flexible

+++?image=assets/gophers.jpg

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

#### e.g.) Table Driven Tests

``` go
func TestUnit(t *testing.T) {
    candidates := []struct{
        in float64
        expected int
    }{
        {in: -0.1, expected: 0},
        {in: 0, expected: 0},
        {in: 0.1, expected: 1},
    }
    for _, c := range candidates {
        t.Logf("input: %f", c.in)
        if out := Unit(c.in); out != c.expected {
            t.Errorf("error: %d != %d", out, c.expected)
            return
        }
    }
}
```

@[2-9](define test values)
@[10-16](test the values)
@[6-8](if you want to add some test patterns, you can add easily)


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

+++

### Example Tests

* functions of the form:
  + `func ExampleXxx()`
* when ran the test, also verified example codes
  + if there's a line comment begining with "Output", the example code will ran and compared the Output

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

#### without -http flag

* command-line golang package reference
  - `godoc fmt`
    + documentation for package `fmt`

#### with -http flag

* runs as a web server and presents the docs as a web page
  - like https://golang.org

+++

### present

`$ go get golang.org/x/tools/cmd/present`

* slide presentation
  - like: https://talks.golang.org/2017/state-of-go.slide#1
* can run go code in slides

+++

## The Go PlayGround

https://play.golang.org/

* you can run go code on browser
* you can share go code

+++

# Q?
