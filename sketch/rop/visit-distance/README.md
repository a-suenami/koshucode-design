# I/O List

- koshu [binary.k](#binaryk)
- koshu [call.k](#callk)
- koshu [diamond.k](#diamondk)
- koshu [empty.k](#emptyk)
- koshu [linear.k](#lineark)
- koshu [mutual.k](#mutualk)
- koshu [self.k](#selfk)



## [binary.k](binary.k)

```
-*- koshu -*-

input "call.k"

|-- CALL  /caller 'a  /callee 'b
|-- CALL  /caller 'a  /callee 'c
|-- CALL  /caller 'b  /callee 'd
|-- CALL  /caller 'b  /callee 'e
|-- CALL  /caller 'c  /callee 'f
|-- CALL  /caller 'c  /callee 'g
```

Command `koshu binary.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    call.k
**    binary.k
**
**  OUTPUT
**    <stdout>
**

|-- CALL-DOWN  /caller 'a  /call {= /n /caller [ 0 | 'a ] [ 1 | 'b ] [ 1 | 'c ] [ 2 | 'd ] [ 2 | 'e ] [ 2 | 'f ] [ 2 | 'g ] =}

*** 1 judge 

=== note

TABLE : CALL-DOWN

  /caller /call
  ------- -----------
  'a      /n  /caller
          --- -------
          0   'a
          1   'b
          1   'c
          2   'd
          2   'e
          2   'f
          2   'g
          

=== rel

|-- CALL-UP  /callee 'd  /call {= /n /callee [ 0 | 'd ] [ 1 | 'b ] [ 2 | 'a ] =}

*** 1 judge 

=== note

TABLE : CALL-UP

  /callee /call
  ------- -----------
  'd      /n  /callee
          --- -------
          0   'd
          1   'b
          2   'a
          

=== rel

**
**  SUMMARY
**       1 judge  on CALL-DOWN
**       1 judge  on CALL-UP
**       2 judges in total
**
```



## [call.k](call.k)

```
-*- koshu -*-

call-down : call @'1 -from /caller -to /callee
call-up   : call @'1 -from /callee -to /caller

call : add @from @'1
  | visit-distance ( source CALL /caller /callee )
         -step @from : @to -to /call -distance /n

|== CALL-DOWN  : call-down 'a  --order --table --forward /caller
|== CALL-UP    : call-up   'd  --order --table --forward /callee
```

Command `koshu call.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    call.k
**
**  OUTPUT
**    <stdout>
**

|-- CALL-DOWN  /caller 'a  /call {= /n /caller [ 0 | 'a ] =}

*** 1 judge 

=== note

TABLE : CALL-DOWN

  /caller /call
  ------- -----------
  'a      /n  /caller
          --- -------
          0   'a
          

=== rel

|-- CALL-UP  /callee 'd  /call {= /n /callee [ 0 | 'd ] =}

*** 1 judge 

=== note

TABLE : CALL-UP

  /callee /call
  ------- -----------
  'd      /n  /callee
          --- -------
          0   'd
          

=== rel

**
**  SUMMARY
**       1 judge  on CALL-DOWN
**       1 judge  on CALL-UP
**       2 judges in total
**
```



## [diamond.k](diamond.k)

```
-*- koshu -*-

input "call.k"

|-- CALL  /caller 'a  /callee 'b
|-- CALL  /caller 'a  /callee 'c
|-- CALL  /caller 'b  /callee 'd
|-- CALL  /caller 'c  /callee 'd
```

Command `koshu diamond.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    call.k
**    diamond.k
**
**  OUTPUT
**    <stdout>
**

|-- CALL-DOWN  /caller 'a  /call {= /n /caller [ 0 | 'a ] [ 1 | 'b ] [ 1 | 'c ] [ 2 | 'd ] =}

*** 1 judge 

=== note

TABLE : CALL-DOWN

  /caller /call
  ------- -----------
  'a      /n  /caller
          --- -------
          0   'a
          1   'b
          1   'c
          2   'd
          

=== rel

|-- CALL-UP  /callee 'd  /call {= /n /callee [ 0 | 'd ] [ 1 | 'b ] [ 1 | 'c ] [ 2 | 'a ] =}

*** 1 judge 

=== note

TABLE : CALL-UP

  /callee /call
  ------- -----------
  'd      /n  /callee
          --- -------
          0   'd
          1   'b
          1   'c
          2   'a
          

=== rel

**
**  SUMMARY
**       1 judge  on CALL-DOWN
**       1 judge  on CALL-UP
**       2 judges in total
**
```



## [empty.k](empty.k)

```
-*- koshu -*-

input "call.k"
```

Command `koshu empty.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    call.k
**    empty.k
**
**  OUTPUT
**    <stdout>
**

|-- CALL-DOWN  /caller 'a  /call {= /n /caller [ 0 | 'a ] =}

*** 1 judge 

=== note

TABLE : CALL-DOWN

  /caller /call
  ------- -----------
  'a      /n  /caller
          --- -------
          0   'a
          

=== rel

|-- CALL-UP  /callee 'd  /call {= /n /callee [ 0 | 'd ] =}

*** 1 judge 

=== note

TABLE : CALL-UP

  /callee /call
  ------- -----------
  'd      /n  /callee
          --- -------
          0   'd
          

=== rel

**
**  SUMMARY
**       1 judge  on CALL-DOWN
**       1 judge  on CALL-UP
**       2 judges in total
**
```



## [linear.k](linear.k)

```
-*- koshu -*-

input "call.k"

|-- CALL  /caller 'a  /callee 'b
|-- CALL  /caller 'b  /callee 'c
|-- CALL  /caller 'c  /callee 'd
```

Command `koshu linear.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    call.k
**    linear.k
**
**  OUTPUT
**    <stdout>
**

|-- CALL-DOWN  /caller 'a  /call {= /n /caller [ 0 | 'a ] [ 1 | 'b ] [ 2 | 'c ] [ 3 | 'd ] =}

*** 1 judge 

=== note

TABLE : CALL-DOWN

  /caller /call
  ------- -----------
  'a      /n  /caller
          --- -------
          0   'a
          1   'b
          2   'c
          3   'd
          

=== rel

|-- CALL-UP  /callee 'd  /call {= /n /callee [ 0 | 'd ] [ 1 | 'c ] [ 2 | 'b ] [ 3 | 'a ] =}

*** 1 judge 

=== note

TABLE : CALL-UP

  /callee /call
  ------- -----------
  'd      /n  /callee
          --- -------
          0   'd
          1   'c
          2   'b
          3   'a
          

=== rel

**
**  SUMMARY
**       1 judge  on CALL-DOWN
**       1 judge  on CALL-UP
**       2 judges in total
**
```



## [mutual.k](mutual.k)

```
-*- koshu -*-

input "call.k"

|-- CALL  /caller 'a  /callee 'd
|-- CALL  /caller 'd  /callee 'a
```

Command `koshu mutual.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    call.k
**    mutual.k
**
**  OUTPUT
**    <stdout>
**

|-- CALL-DOWN  /caller 'a  /call {= /n /caller [ 0 | 'a ] [ 1 | 'd ] =}

*** 1 judge 

=== note

TABLE : CALL-DOWN

  /caller /call
  ------- -----------
  'a      /n  /caller
          --- -------
          0   'a
          1   'd
          

=== rel

|-- CALL-UP  /callee 'd  /call {= /n /callee [ 0 | 'd ] [ 1 | 'a ] =}

*** 1 judge 

=== note

TABLE : CALL-UP

  /callee /call
  ------- -----------
  'd      /n  /callee
          --- -------
          0   'd
          1   'a
          

=== rel

**
**  SUMMARY
**       1 judge  on CALL-DOWN
**       1 judge  on CALL-UP
**       2 judges in total
**
```



## [self.k](self.k)

```
-*- koshu -*-

input "call.k"

|-- CALL  /caller 'a  /callee 'a
```

Command `koshu self.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    call.k
**    self.k
**
**  OUTPUT
**    <stdout>
**

|-- CALL-DOWN  /caller 'a  /call {= /n /caller [ 0 | 'a ] =}

*** 1 judge 

=== note

TABLE : CALL-DOWN

  /caller /call
  ------- -----------
  'a      /n  /caller
          --- -------
          0   'a
          

=== rel

|-- CALL-UP  /callee 'd  /call {= /n /callee [ 0 | 'd ] =}

*** 1 judge 

=== note

TABLE : CALL-UP

  /callee /call
  ------- -----------
  'd      /n  /callee
          --- -------
          0   'd
          

=== rel

**
**  SUMMARY
**       1 judge  on CALL-DOWN
**       1 judge  on CALL-UP
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
