# Haskell Compiler

A simple compiler for a small functional language written in Haskell, featuring lexical analysis, parsing, type checking, and interpretation.

The key implementation for the LP class is the implementation of the List functionality

Developed by Luiz Guilherme Zanella Lopes & Tiago Azevedo

## Features

- **Arithmetic operations**: `+`, `*`
- **Boolean operations**: `&&`, `||`
- **Conditional expressions**: `if <cond> (<true-branch>) (<false-branch>)`
- **Lists**: `[1,2,3]`, `[[1,2],[3]]`

## Running

### Single expression

```bash
echo "1+2" | runhaskell Main.hs
```

### From a file

```bash
runhaskell Main.hs < examples/example1.fonte
```

### Run all tests

```bash
cd examples
./run_tests.sh
```

## Example Expressions

```
1+2                           -> Num 3
2*3+4                         -> Num 10
(1+2)*3                       -> Num 9
if true (1+2) (3*4)           -> Num 3
true || false                 -> BTrue
false && true                 -> BFalse
[1,2,3]                       -> List [Num 1,Num 2,Num 3]
[[1,2],[3]]                   -> List [List [Num 1,Num 2],List [Num 3]]
```
