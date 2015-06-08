# I/O List

-  [./koshu-rts-stat.sh 0](#koshu-rts-statsh-0)
-  [./koshu-rts-stat.sh 1](#koshu-rts-statsh-1)
-  [./koshu-rts-stat.sh 2](#koshu-rts-statsh-2)
-  [./koshu-rts-stat.sh 4](#koshu-rts-statsh-4)
-  [./koshu-rts-stat.sh 8](#koshu-rts-statsh-8)
-  [./koshu-rts-stat.sh 16](#koshu-rts-statsh-16)
-  [./koshu-rts-stat.sh 32](#koshu-rts-statsh-32)
-  [./koshu-rts-stat.sh 64](#koshu-rts-statsh-64)
-  [./koshu-rts-stat.sh 128](#koshu-rts-statsh-128)
-  [./koshu-rts-stat.sh 256](#koshu-rts-statsh-256)
-  [./koshu-rts-stat.sh 512](#koshu-rts-statsh-512)
-  [./koshu-rts-stat.sh 1024](#koshu-rts-statsh-1024)
-  [./koshu-rts-stat.sh 2048](#koshu-rts-statsh-2048)
-  [./koshu-rts-stat.sh 4096](#koshu-rts-statsh-4096)
-  [./koshu-rts-stat.sh 8192](#koshu-rts-statsh-8192)



## ./koshu-rts-stat.sh 0

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 0` produces:

```
         157,672 bytes allocated in the heap
           3,168 bytes copied during GC
          84,960 bytes maximum residency (1 sample(s))
          17,440 bytes maximum slop
               1 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0         0 colls,     0 par    0.00s    0.00s     0.0000s    0.0000s
  Gen  1         1 colls,     0 par    0.00s    0.00s     0.0002s    0.0002s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.00s  (  0.00s elapsed)
  GC      time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.00s  (  0.00s elapsed)

  %GC     time       5.2%  (14.2% elapsed)

  Alloc rate    594,988,679 bytes per MUT second

  Productivity  91.8% of total user, 167.1% of total elapsed

```



## ./koshu-rts-stat.sh 1

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 1` produces:

```
         257,792 bytes allocated in the heap
           3,168 bytes copied during GC
          84,960 bytes maximum residency (1 sample(s))
          17,440 bytes maximum slop
               1 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0         0 colls,     0 par    0.00s    0.00s     0.0000s    0.0000s
  Gen  1         1 colls,     0 par    0.00s    0.00s     0.0002s    0.0002s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.00s  (  0.00s elapsed)
  GC      time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.00s  (  0.00s elapsed)

  %GC     time       3.7%  (9.7% elapsed)

  Alloc rate    560,417,391 bytes per MUT second

  Productivity  93.3% of total user, 168.4% of total elapsed

```



## ./koshu-rts-stat.sh 2

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 2` produces:

```
         350,512 bytes allocated in the heap
           3,168 bytes copied during GC
          84,960 bytes maximum residency (1 sample(s))
          17,440 bytes maximum slop
               1 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0         0 colls,     0 par    0.00s    0.00s     0.0000s    0.0000s
  Gen  1         1 colls,     0 par    0.00s    0.00s     0.0002s    0.0002s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.00s  (  0.00s elapsed)
  GC      time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.00s  (  0.00s elapsed)

  %GC     time       4.4%  (10.1% elapsed)

  Alloc rate    668,916,030 bytes per MUT second

  Productivity  93.0% of total user, 147.9% of total elapsed

```



## ./koshu-rts-stat.sh 4

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 4` produces:

```
         535,952 bytes allocated in the heap
           3,168 bytes copied during GC
          84,960 bytes maximum residency (1 sample(s))
          17,440 bytes maximum slop
               1 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0         0 colls,     0 par    0.00s    0.00s     0.0000s    0.0000s
  Gen  1         1 colls,     0 par    0.00s    0.00s     0.0002s    0.0002s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.00s  (  0.00s elapsed)
  GC      time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.00s  (  0.00s elapsed)

  %GC     time       4.0%  (8.4% elapsed)

  Alloc rate    802,323,353 bytes per MUT second

  Productivity  93.6% of total user, 134.0% of total elapsed

```



## ./koshu-rts-stat.sh 8

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 8` produces:

```
         906,832 bytes allocated in the heap
          56,936 bytes copied during GC
          84,960 bytes maximum residency (1 sample(s))
          21,536 bytes maximum slop
               1 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0         1 colls,     0 par    0.00s    0.00s     0.0001s    0.0001s
  Gen  1         1 colls,     0 par    0.00s    0.00s     0.0001s    0.0001s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.00s  (  0.00s elapsed)
  GC      time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.00s  (  0.00s elapsed)

  %GC     time       7.0%  (12.8% elapsed)

  Alloc rate    930,084,102 bytes per MUT second

  Productivity  90.9% of total user, 124.3% of total elapsed

```



## ./koshu-rts-stat.sh 16

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 16` produces:

```
       1,648,856 bytes allocated in the heap
         211,312 bytes copied during GC
         115,112 bytes maximum residency (2 sample(s))
          22,120 bytes maximum slop
               1 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0         2 colls,     0 par    0.00s    0.00s     0.0002s    0.0002s
  Gen  1         2 colls,     0 par    0.00s    0.00s     0.0005s    0.0010s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.00s  (  0.00s elapsed)
  GC      time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.00s  (  0.00s elapsed)

  %GC     time      24.2%  (36.9% elapsed)

  Alloc rate    1,105,872,568 bytes per MUT second

  Productivity  74.3% of total user, 83.9% of total elapsed

```



## ./koshu-rts-stat.sh 32

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 32` produces:

```
       3,132,112 bytes allocated in the heap
         533,344 bytes copied during GC
         220,568 bytes maximum residency (2 sample(s))
          21,536 bytes maximum slop
               1 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0         4 colls,     0 par    0.00s    0.00s     0.0002s    0.0002s
  Gen  1         2 colls,     0 par    0.00s    0.00s     0.0015s    0.0030s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.00s  (  0.00s elapsed)
  GC      time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.01s  (  0.01s elapsed)

  %GC     time      39.6%  (52.3% elapsed)

  Alloc rate    1,288,404,771 bytes per MUT second

  Productivity  59.5% of total user, 57.3% of total elapsed

```



## ./koshu-rts-stat.sh 64

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 64` produces:

```
       6,100,152 bytes allocated in the heap
       1,220,952 bytes copied during GC
         229,272 bytes maximum residency (2 sample(s))
          22,616 bytes maximum slop
               2 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0        10 colls,     0 par    0.00s    0.00s     0.0002s    0.0004s
  Gen  1         2 colls,     0 par    0.00s    0.00s     0.0018s    0.0035s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.00s  (  0.01s elapsed)
  GC      time    0.00s  (  0.01s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.01s  (  0.01s elapsed)

  %GC     time      38.3%  (47.0% elapsed)

  Alloc rate    1,249,007,371 bytes per MUT second

  Productivity  60.9% of total user, 56.6% of total elapsed

```



## ./koshu-rts-stat.sh 128

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 128` produces:

```
      12,036,360 bytes allocated in the heap
       3,199,752 bytes copied during GC
         889,352 bytes maximum residency (3 sample(s))
          26,448 bytes maximum slop
               3 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0        21 colls,     0 par    0.00s    0.00s     0.0001s    0.0002s
  Gen  1         3 colls,     0 par    0.00s    0.01s     0.0017s    0.0028s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.01s  (  0.01s elapsed)
  GC      time    0.01s  (  0.01s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.02s  (  0.02s elapsed)

  %GC     time      39.9%  (47.6% elapsed)

  Alloc rate    1,524,747,909 bytes per MUT second

  Productivity  59.6% of total user, 57.6% of total elapsed

```



## ./koshu-rts-stat.sh 256

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 256` produces:

```
      23,907,520 bytes allocated in the heap
       7,323,360 bytes copied during GC
       1,663,960 bytes maximum residency (4 sample(s))
          29,968 bytes maximum slop
               5 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0        43 colls,     0 par    0.01s    0.01s     0.0002s    0.0003s
  Gen  1         4 colls,     0 par    0.01s    0.01s     0.0024s    0.0041s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.02s  (  0.02s elapsed)
  GC      time    0.01s  (  0.02s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.03s  (  0.04s elapsed)

  %GC     time      41.6%  (46.3% elapsed)

  Alloc rate    1,337,708,146 bytes per MUT second

  Productivity  58.2% of total user, 56.4% of total elapsed

```



## ./koshu-rts-stat.sh 512

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 512` produces:

```
      47,683,864 bytes allocated in the heap
      15,251,768 bytes copied during GC
       3,186,688 bytes maximum residency (5 sample(s))
          43,968 bytes maximum slop
               8 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0        87 colls,     0 par    0.01s    0.01s     0.0001s    0.0004s
  Gen  1         5 colls,     0 par    0.01s    0.02s     0.0035s    0.0070s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.03s  (  0.04s elapsed)
  GC      time    0.03s  (  0.03s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.06s  (  0.07s elapsed)

  %GC     time      41.6%  (45.8% elapsed)

  Alloc rate    1,387,328,387 bytes per MUT second

  Productivity  58.3% of total user, 55.3% of total elapsed

```



## ./koshu-rts-stat.sh 1024

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 1024` produces:

```
      95,235,424 bytes allocated in the heap
      30,519,864 bytes copied during GC
       5,840,992 bytes maximum residency (6 sample(s))
          85,208 bytes maximum slop
              13 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0       178 colls,     0 par    0.03s    0.03s     0.0002s    0.0005s
  Gen  1         6 colls,     0 par    0.02s    0.03s     0.0048s    0.0118s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.07s  (  0.07s elapsed)
  GC      time    0.05s  (  0.06s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.12s  (  0.13s elapsed)

  %GC     time      40.3%  (43.6% elapsed)

  Alloc rate    1,337,914,416 bytes per MUT second

  Productivity  59.6% of total user, 56.4% of total elapsed

```



## ./koshu-rts-stat.sh 2048

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 2048` produces:

```
     190,305,904 bytes allocated in the heap
      61,358,280 bytes copied during GC
      11,119,000 bytes maximum residency (7 sample(s))
         142,496 bytes maximum slop
              24 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0       360 colls,     0 par    0.05s    0.05s     0.0001s    0.0003s
  Gen  1         7 colls,     0 par    0.04s    0.05s     0.0066s    0.0172s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.13s  (  0.13s elapsed)
  GC      time    0.08s  (  0.09s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.21s  (  0.22s elapsed)

  %GC     time      38.9%  (41.8% elapsed)

  Alloc rate    1,485,221,636 bytes per MUT second

  Productivity  61.1% of total user, 58.3% of total elapsed

```



## ./koshu-rts-stat.sh 4096

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 4096` produces:

```
     380,445,736 bytes allocated in the heap
     121,905,984 bytes copied during GC
      20,734,784 bytes maximum residency (8 sample(s))
         286,344 bytes maximum slop
              43 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0       726 colls,     0 par    0.10s    0.10s     0.0001s    0.0009s
  Gen  1         8 colls,     0 par    0.07s    0.09s     0.0116s    0.0417s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.29s  (  0.29s elapsed)
  GC      time    0.18s  (  0.20s elapsed)
  EXIT    time    0.00s  (  0.00s elapsed)
  Total   time    0.47s  (  0.49s elapsed)

  %GC     time      37.9%  (40.4% elapsed)

  Alloc rate    1,324,630,272 bytes per MUT second

  Productivity  62.1% of total user, 59.2% of total elapsed

```



## ./koshu-rts-stat.sh 8192

```
#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
```

Command `./koshu-rts-stat.sh 8192` produces:

```
     760,726,272 bytes allocated in the heap
     294,283,520 bytes copied during GC
      57,344,040 bytes maximum residency (10 sample(s))
         530,080 bytes maximum slop
             128 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0      1458 colls,     0 par    0.20s    0.21s     0.0001s    0.0021s
  Gen  1        10 colls,     0 par    0.22s    0.27s     0.0273s    0.1213s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time    0.55s  (  0.55s elapsed)
  GC      time    0.43s  (  0.48s elapsed)
  EXIT    time    0.00s  (  0.01s elapsed)
  Total   time    0.98s  (  1.04s elapsed)

  %GC     time      43.5%  (46.4% elapsed)

  Alloc rate    1,384,543,358 bytes per MUT second

  Productivity  56.4% of total user, 53.2% of total elapsed

```



## command

This document is produced by the command:

```
koshu-inout.sh -r -f command
```
