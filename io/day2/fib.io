recurFib := method(n, 
              (call sender if(n == 1, 1,
               call sender if(n == 2, 1,
               call sender recurFib(n - 1) + call sender recurFib(n - 2)))))

"recursive fib" println
recurFib(1) println
recurFib(4) println
recurFib(8) println

loopFib := method(n,
            if(n == 1, return 1)
            if(n == 2, return 1)
            i := 2
            current := 1
            last := 1
            while(i < n,
              tmp := current
              current := last + current
              last := tmp
              i = i + 1
            )
            current)

"loop fib" println
loopFib(1) println
loopFib(4) println
loopFib(8) println
