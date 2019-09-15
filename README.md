# Toou 2D  拿来即用，为简单而生。

![](https://img.shields.io/badge/Version-1.0-red) ![](https://img.shields.io/badge/Build-passing-green) ![](https://img.shields.io/badge/License-MIT-green)

[![](https://img.shields.io/badge/S-使用指南-blue)](https://github.com/ShowFL/Toou-2D/wiki/如何构建) [![](https://img.shields.io/badge/B-版本说明-blue)](https://github.com/ShowFL/Toou-2D/wiki/版本说明) [![](https://img.shields.io/badge/D-Demo源码-blue)](https://github.com/ShowFL/Toou-2D/wiki/Demo欣赏) [![](https://img.shields.io/badge/G-高级教程-blue)](https://github.com/ShowFL/Toou-2D/wiki/如何制作theme) [![](https://img.shields.io/badge/C-常见问题-blue)](https://github.com/ShowFL/Toou-2D/wiki/常见问题) 

简称`T2D`，是一款采用自身模块规范编写的轻量级UI框架，遵循Qt书写与组织形式门槛极低无需深入学习简单易用可[`拿来即用`](#)，丰富的控件模块适合界面的快速开发，让程序人员拥有更多的精力来实现业务逻辑与算法。

* 统一交互规范，丰富的Ui控件[`几十种常用控件`](#)放弃了Qt Controls 及 Controls 2 来提高性能。

* 完善的主题系统，业务逻辑与界面主题设计分离，可通过简单修改变量[`自定义主题`](#)皮肤。灵活的多主题皮肤绑定机制、在不需要重启App即实现[`一键换肤`](#)

* ini皮肤配置规则与每一个控件融合。可在应用内配置也可在应用外动态扩展配置。

* 框架自动化安装支持动态库、静态库多模式编译。使用方便更安全更自由。 

* 提供丰富Demo、全面的帮助文档，Api查阅快速方便。[`项目必备`](#)开源框架！

* 已经集成最新版 [`Font Awesome 4.7`](#)

## Demo 效果

![](http://oss.toou.net/github-resources/2d/preview.gif) ![](http://oss.toou.net/github-resources/2d/preview_musicplayer.gif)

* [更多独立Demo下载地址](https://github.com/ShowFL/Toou-2D/wiki/Demo欣赏)

## 运行 Example 快速开始

> 需要Qt 5.6 或更高版本。
> 1. 将项目clone到本地 使用Qt creator 打开 Toou-2D.pro
> 2. 构建 （先构建后运行）
> 3. 运行即可即可看到demo 预览效果。

*支持 macOS ,Windows 构建，可发布到 macOS,Windows,iOS,Android等多平台。*

* [iOS 使用特殊细节](https://github.com/ShowFL/Toou-2D/wiki/常见问题#qt-for-ios-error-module-is-not-installed)
* [高级构建方法](https://github.com/ShowFL/Toou-2D/wiki/如何构建)

## 自定义主题

首先T2D的皮肤数据全部定义在 ini文件中，这些ini配置文件可以写在应用内也可以是应用的外部。通过修改ini节点属性及简单通用的规则即可实现完美的皮肤制作。

在src-toou2d中，我们为您配置了两款默认皮肤。

* [ini Theme配置详解](https://github.com/ShowFL/Toou-2D/wiki/如何制作theme)
* [参考Wiki 自制一套皮肤](https://github.com/ShowFL/Toou-2D/wiki/如何制作theme)

## 让你的控件也支持主题切换

TThemeBinder控件与主题样式数据绑定在一起。废话不说看代码，如下:

```
//!当主题发展改变，Rectangle也会改变他的 color , width
//!同时不会打破 width 的原有绑定。
Rectangle{
    id:rect;
    width : parent.width;
    height: 100;
    color : "red";

    TThemeBinder{
        id:theme
        className: "MRect"
        property alias color:  rect.color;
        property alias width:  rect.width;
        property alias height: rect.height;
    }
}
```

[参考Wiki 更高级的玩法](https://github.com/ShowFL/Toou-2D/wiki/如何制作theme)

## 如何使用帮助文档

我们提供了在线与离线两种文档方式。离线文档支持Qt create(F1) 与 Qt Assistant

* [在线文档 http://oss.toou.net/docs/2d/](http://oss.toou.net/docs/2d/index.html)
* [离线文档使用方法](https://github.com/ShowFL/Toou-2D/wiki/使用文档)

## 设备运行测试

| 平台 | 结果 | 平台 | 结果 | 平台 | 结果 |
| --- | --- | --- | --- | --- | --- |
| Windows 7 | OK | Windows 10 | OK | iOS iPad mini | OK |
| macOS 10.12 | OK | macOS 10.14 | OK | iOS iPhone XR | OK | 
| Android 华为 4.4| OK | Android 小米 7.0| OK | iOS iPhone 8 plus | OK |
| Android Mi Pad 8.0| OK | Android vivo 8.0| OK | iOS iPhone 6 | OK |
 



## 一张图读懂 Toou 2D

![](http://showfl.com/t2d.png)


## 值得一提的事情
[`Toou`](http://www.toou.net) 感谢您的关注,记得点星哦！~
