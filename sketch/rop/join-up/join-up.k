** -*- koshu -*-
**
**  概要
**    join-up /P ... は重関係 /P ... の結びをつくり、
**    その結びを出力関係とします。
**

|-- P  /a 1  /b 10
|-- P  /a 1  /b 12
|-- P  /a 2  /b 14

|-- Q  /b 10  /c 40
|-- Q  /b 10  /c 45
|-- Q  /b 12  /c 50

|-- R  /a 1  /c 50
|-- R  /a 1  /c 55

p : source P /a /b
q : source Q /b /c
r : source R /a /c

s : p | group q -to /g
      | group r -to /h

|== S : s  --table --forward /a /b /g /h

|== T : s | join-up
|== U : s | join-up /g
|== V : s | join-up /g /h
