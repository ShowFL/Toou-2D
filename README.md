# Toou 2D  拿来即用，为简单而生。

![](https://img.shields.io/badge/Version-Alpha-red) ![](https://img.shields.io/badge/Build-passing-green) ![](https://img.shields.io/badge/iOS-passing-green) ![](https://img.shields.io/badge/Android-passing-green) ![](https://img.shields.io/badge/macOS-passing-green) ![](https://img.shields.io/badge/Windows-passing-green) 

简称`T2D`，基于Qt Qml跨平台技术的2D轻量级Ui引擎，无需深入学习，简单易用可[`拿来即用`](#)

* 业务逻辑与界面主题设计分离，可通过修改变量[`自定义主题`](#)界面。内置多种主题，方便更高级的扩展还支持[`自定义主题属性`](#)，为所欲为来满足项目的个性化需求。灵活的皮肤绑定机制、在不需要重启App即实现[`一键换肤`](#)

* 设计师可以很容易理解并设计出精美的主题，这样会提高项目整体的开发效率。让开发人员专注于业务逻辑的实现而非技术细节，而且[`方便维护扩展`](#)

* 统一交互规范，封装了常用控件，其中包括[`Toast`](#)，[`Dialog`](#)，[`Popover`](#)，[`AwesomeIcon`](#)等等，每个控件的开发都是以服务实际项目需要为目的，大部分控件我们已经放弃了Qt Controls 及 Controls 2 来提高性能。

* 提供丰富Demo、全面的使用文档，Api查阅快速方便。[`项目必备`](#)开源框架！

* 已经集成最新版 [`Font Awesome 4.7`](#)
<br> </br>

## Demo 效果

![](http://showfl.com/t2dsample/toou2d.gif)
<br> </br>

## 运行 Demo 快速开始

需要Qt 5.6 或更高版本。
1. 将项目clone到本地 使用Qt creator 打开 Toou-2D.pro
2. 运行即可即可看到demo 预览效果。

*支持 macOS ,Windows 构建，可发布到 macOS,Windows,iOS,Android等多平台。*

[iOS 使用特殊细节](#)
<br> </br>

## 如何构建并使用

支持编译Qml插件动态库，及静态库两种形式供您的项目使用。
1. 使用Qt creator 打开 src-toou2d/Toou2D.pro
2. 开始构建即可

* 默认为 Qml Plugin 动态库形式。无需任何修改。

```
CONFIG  += install
已编译好的 Qml Plugin 自动安装到Qt安装目录中，不需要配置你的项目pro省时省力。
```

* 静态库形式

```
CONFIG += staticlib
编译后在构建目录的bin文件夹中。同时还需要在你的项目中自行配置pro文件
```

[参考Wiki 具体配置方法](#)
<br> </br>


## 自定义主题

首先T2D的皮肤数据全部定义在 ini文件中，这些ini配置文件可以写在应用内也可以是应用的外部。通过修改ini节点属性及简单通用的规则即可实现完美的皮肤制作。

在src-toou2d中，我们为您配置了两款默认皮肤。

[参考Wiki 自制一套皮肤](#)
<br> </br>

## 让你的控件也支持主题切换

TThemeBinder控件与主题样式数据绑定在一起。废话不说看代码，如下:

```
//!当主题发展改变，Rectangle也会改变他的 color , width
Rectangle{
    width: theme.width;
    color: theme.bgcolor;

    TThemeBinder{
        id:theme
        type: "MRectangle"
        property color bgcolor: bindingColor("bgcolor","blue");
        property int   width: bindingInt("width",200);
    }
}
```

[参考Wiki 更高级的玩法](#)
<br> </br>

## 设备运行测试

| 平台 | 结果 |
| --- | --- |
| Windows 7 | OK |
| Windows 10 | OK |
| macOS 10.12 | OK |
| macOS 10.14 | OK |
| Android 华为 4.4| OK |
| Android 小米 7.0| OK |
| Android Mi Pad 8.0| OK |
| Android vivo 8.0| OK |
| iOS iPhone 6 | OK |
| iOS iPhone 8 plus | OK |
| iOS iPhone XR | OK |
| iOS iPad mini | OK |

<br> </br>

## 一张图读懂 Toou 2D

![](http://showfl.com/t2d.png)

## 值得回忆的时刻

2019年7月22日 入驻Github 建立项目公开T2D源码。

## 值得一提的事情
[`Toou`](http://www.toou.net) 感谢您的关注,记得点星哦！~
