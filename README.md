# 参考课本

*Professional Assembly Language*
*Richard Blum*

# 运行指令

- 普通运行命令

```
as temp.s -o temp.o -g
ld temp.o -o a.out 
```

- 调用C语言库时的命令

```
as temp.s -o temp.o -g --32
ld temp.o -o a.out -dynamic-linker /lib/ld-linux.so.2 -m elf_i386 -lc
```
