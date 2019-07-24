
# Toou-2D

简称`T2D`，基于`Qt`跨平台技术的`2D`轻量级Ui引擎，它使得App可以快速开发与构建。T2D全新封装了常用控件，包括`Toast`，`Dialog`，`Popover`，`AwesomeIcon`等等，大部分控件我们已经放弃了Qt的Controls 及 Controls 2，不需要重启App即实现一键换肤。 T2D提供了丰富、全面的使用文档，Api查阅快速方便。(Wiki正在努力建设中，文档会陆续开放)
<br>已经集成最新版本 `Font Awesome 4.7`
<br>![](http://showfl.com/t2dsample/toou2d.gif)
## 如何使用 example

1. 需要Qt 5.9.6 或更高版本。
2. 将项目clone到本地，使用Qt Create打开Toou-2D.pro
3. 运行即可。

## 如何构建及编译

支持编译Qml插件动态库，及静态库两种形式使用。
1. 使用Qt Creator打开项目。
2. 根据自身使用需求修改Toou2D.pro 
```
CONFIG  += install
自动将编译后的qml plugin安装到Qt安装目录中。
```
```
CONFIG += staticlib
只编译.a静态库到构建目录的bin文件夹里。不会自动安装。使用时需要在App pro中配置才可以使用。 
```

- [详情请点击这里]()

## Api文档查阅

T2D带有非常详细的使用文档及Api帮助文档。
- [详情请点击这里]()


## 平台编译及运行测试结果

| 平台 | 编译结果 |运行结果 |
| --- | --- |--- |
| macOS | OK | OK |
| Windows | OK | OK|
| Android | OK | OK|
| iOS | OK | OK|

#### 运行设备

| 平台 | 结果 |
| --- | --- |
| Android 华为 4.4| OK |
| Android 小米 7.0| OK |
| Android vivo 8.0| OK |
| iOS iPhone 6 | OK |
| iOS iPhone 8 plus | OK |
| iOS iPhone XR | OK |
| iOS iPad mini | OK |


## 值得一提的事情

[`Toou`](http://www.toou.net) 感谢您的关注。记得点星哦！~
