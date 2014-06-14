# 表形式による判断集合の表示


甲州記法は、関係モデル (リレーショナル・モデル) に準拠しているため、
データセットを判断集合としてあらわします。
個々の判断は、判断記号 `|--`、判断種 `ENROLMENT`、
項目名 `/student-id`、項目内容 `'S1` を使って表現します。
たとえば、つぎのようになります。

```
|-- ENROLMENT  /student-id 'S1  /course-id 'C1  /name "Anne"
|-- ENROLMENT  /student-id 'S1  /course-id 'C2  /name "Anne"
|-- ENROLMENT  /student-id 'S2  /course-id 'C1  /name "Boris"
|-- ENROLMENT  /student-id 'S3  /course-id 'C3  /name "Cindy"
|-- ENROLMENT  /student-id 'S4  /course-id 'C1  /name "Devinder"
```

この判断集合をよりコンパクトに書くために、
表形式の書き方があってもよいでしょう。
たとえば、判断線を二重に重ねることで、
判断集合が表形式で書かれることを示せます。

```
||-- ENROLMENT
   | /student-id : /course-id : /name
   | 'S1 : 'C1 : "Anne"
   | 'S1 : 'C2 : "Anne"
   | 'S2 : 'C1 : "Boris"
   | 'S3 : 'C3 : "Cindy"
   | 'S4 : 'C1 : "Devinder"
```

