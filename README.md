
# lib-zo

一个 C 协程库

本协程库是从 [https://github.com/mailhonor/lib-zc](https://github.com/mailhonor/lib-zc) 抽出来的,
可单独使用

帮助文档 https://github.com/mailhonor/lib-zc/blob/master/doc/coroutine.md

## 感谢

本协程库的实现参考了 libco, libgo, nodejs 的实现

## 介绍

支持文件IO类协程化(如mkdir, getdents等)

支持协程条件, 协程锁

慢操作协程化

支持sleep

可以禁用 UDP 协程切换

部分支持dns协议

支持静态编译

## 睡眠

支持sleep

不支持usleep和nanosleep

毫秒睡眠请用 void zcoroutine\_sleep\_millisecond(int milliseconds);

## 支持的文件io

可开启支持文件io在其他线程池工作

open, openat, close, read, readv, write, writev, lseek,

fdatasync, fsync, rename, truncate, ftruncate,

rmdir, mkdir, getdents,

stat, fstat, lstat, link, symlink, readlink, unlink,

chmod, fchmod, chown, fchown, lchown, utime, utimes,

## 支持慢(阻塞式)操作

慢操作可以在其他线程池工作

## dns协议

本框架下, 大部分 glibc 版本的 DNS 解析会有 BUG, 但至少版本 2.12 没问题

如果有问题, 建议:

* 如果需要查询常用域名的 IP 地址, 可以写到 hosts 文件
* 可以考虑 "慢操作协程化"
* 可以禁用 53 端口(既 DNS)的 UDP 协程切换

## 可以禁用 UDP 协程切换

可以禁用 UDP 协程切换, 可以禁用 53 端口(既 DNS)的 UDP 协程切换

## 源码目录

coroutine.c coroutine.h 是源码

\*\_test.c 是例子

## 编译

make

得到

libzc\_coroutine.a

## 使用

gcc your\_code.c ./libzc\_coroutine.a
