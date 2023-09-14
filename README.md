# Optimization_Algorithm
大三上最优化学习内容
# 最优化课程

[TOC]



## 一维搜索

精确一维搜索：

###     1 Fibonacci法

​                                                              ![image-20230914225623442](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225623.png)     

###     2 黄金分割法

![image-20230914225708006](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225708.png)

​        ![image-20230914225633827](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225633.png)

###       3 进退法

​        ![image-20230914225725177](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225725.png)

###       4 平分法

​          ![image-20230914225646186](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225646.png)

###       5 抛物线法——二次插值法

​        当等距时

​         ![image-20230914225657044](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225657.png)

![image-20230914225744256](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225744.png)

![image-20230914225751355](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225751.png)

不精确一维搜索：

###     Wolfe算法

![image-20230914225759693](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914225759.png)

## 二 无约束最优化方法

### 1 最速下降法

#### 1.1 理论推导

![image-20230914230115974](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914230116.png)

#### 1.2 算法描述

![image-20230914230132969](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914230133.png)

#### 1.3 收敛性

1 整体收敛性

 最速下降法有着很好的整体收敛性，即使对一般的目标函数也是整体收敛的。

2 用于二次函数的收敛速度

 最速下降法仅是线性收敛的，并且有时是很慢的线性收敛。

### 2 牛顿法

#### 2.1理论推导

![image-20230914230249604](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914230249.png)

#### 2.2 算法

![image-20230914230304499](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914230304.png)

#### 2.3 收敛性

   Newton法具有二阶收敛性。

#### 2.4 优缺点与改进

![image-20230914230405065](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914230405.png)

### 3 共轭梯度法

#### 理论推导

![image-20230914230445633](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914230445.png)

#### 算法

**FR共轭梯度法**

![image-20230914230510976](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914230511.png)

**N步重新开始的PRP共轭梯度法**

![image-20230914230728408](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914230728.png)

### 4 拟牛顿法



### 5 Powell方向加速法



## 三  凸二次规划问题

### 拉格朗日法

#### 理论推导

![image-20230914231547366](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914231547.png)

![image-20230914231621665](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914231621.png)



### 有效集法

#### 理论推导

![image-20230914231057043](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914231057.png)

![image-20230914231203476](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914231203.png)

![image-20230914231248153](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914231248.png)

#### 算法步骤

![image-20230914231328767](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914231334.png)

### 罚函数法

**1 外部罚函数法**

![image-20230914232421476](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914232421.png)

![image-20230914232435947](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914232436.png)

**2 内部罚函数法**

![image-20230914232511082](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914232511.png)

### 乘子法

![image-20230914232522438](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914232522.png)

![image-20230914232605349](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914232605.png)

![image-20230914232620764](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914232620.png)

## 四 线性规划问题

![image-20230914232117271](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914232117.png)

### 对偶问题

![image-20230914231905776](https://zuti.oss-cn-qingdao.aliyuncs.com/img/20230914231905.png)

### 对偶单纯形法





## 五 整数线性规划

### 分支定界法



### 割平面法



