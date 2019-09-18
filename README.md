# Toou 2D  拿来即用，为简单而生。

![](https://img.shields.io/badge/Version-1.0-red) ![](https://img.shields.io/badge/Build-passing-green) ![](https://img.shields.io/badge/License-MIT-green)

[![](https://img.shields.io/badge/S-使用指南-blue)](https://github.com/ShowFL/Toou-2D/wiki/如何构建) [![](https://img.shields.io/badge/B-版本说明-blue)](https://github.com/ShowFL/Toou-2D/wiki/版本说明) [![](https://img.shields.io/badge/D-Demo源码-blue)](https://github.com/ShowFL/Toou-2D/wiki/Demo欣赏) [![](https://img.shields.io/badge/G-高级教程-blue)](https://github.com/ShowFL/Toou-2D/wiki/如何制作theme) [![](https://img.shields.io/badge/C-常见问题-blue)](https://github.com/ShowFL/Toou-2D/wiki/常见问题) 

简称`T2D`，由[`Toou`](http://www.toou.net)团队精心打造的Qt(quick) 2D框架，采用自身接口规范编写，它可以在开源和商业应用程序中免费使用,简洁的代码结构易于扩展与修改，完美地兼顾了应用的性能与动态性，解决了组件少、臃肿低效、无皮肤定制的问题。Toou2D使用门槛极低无需深入学习简单易用可`拿来即用`。从核心代码到组件Api的每一处细节都经过精心雕琢，非常适合App界面的`快速开发`。

#### 以下功能毫无保留已全部开源！！！

1. **几十种组件满足你的不同开发需求**
2. **支持动态库、静态库多模式编译**
3. **Qml插件自动化安装，免去繁琐环境搭建**
4. **所有组件都支持Theme特性，ini皮肤制作so easy**
5. **切换皮肤快速响应，一键换肤无需重启**
6. **没有使用Controls与Controls2 的Toou2D性能更佳**
7. **支持 Font Awesome 、Svg Icon**
8. **丰富的Demo供学习和参考，T2D上手更容易**
9. **完善的Api文档，企业项目、团队开发必备开源框架**
10. **规划长期开源路线发展方向明确，长期维护可安心使用**
11. **继承Qt跨平台特性并遵循Qt书写规范**
12. **你提需求我们改进，互助互利共同奋进 ：）**

#  ::: Demo 效果

![](http://oss.toou.net/github-resources/2d/preview.gif) ![](http://oss.toou.net/github-resources/2d/preview_musicplayer.gif)

* [更多独立Demo下载地址](https://github.com/ShowFL/Toou-2D/wiki/Demo欣赏)

#  ::: 运行 Example 快速开始

> 需要Qt 5.6 或更高版本。
> 1. 将项目clone到本地 使用Qt creator 打开 Toou-2D.pro
> 2. 构建 （先构建后运行）
> 3. 运行。即可看到demo预览效果。

*支持 macOS ,Windows 构建，可发布到 macOS,Windows,iOS,Android等多平台。*

* [iOS 使用特殊细节](https://github.com/ShowFL/Toou-2D/wiki/常见问题#qt-for-ios-error-module-is-not-installed)
* [高级构建方法](https://github.com/ShowFL/Toou-2D/wiki/如何构建)

#  ::: Toou2D有哪些组件？废话不说看列表


| 组件名称 | 简短说明 |
| --- | --- |
| TAvatar | 用图标、图片或者字符的形式展示用户或事物信息 |
| TAwesomeIcon| 超级流行的 Font Awesome icon |
| TBadge | 出现在按钮、图标旁的数字或状态标记 |
| TBusyIndicator| 加载数据时显示动效 |
| TButton| 常用的操作按钮 |
| TCarousel| 在有限空间内，循环播放同一类型的图片、文字等内容 |
| TCheckBox| 一组备选项中进行多选 |
| TDialog| 在保留当前页面状态的情况下，告知用户并承载相关操作 |
| TDialogBasic| 可以自定义弹出效果的Dialog |
| TDialogButton| 嵌入在Dialog body 底部的操控按钮 |
| TDividerLine| 一条线段、分割线、底线  |
| TFlickable| 内容可拖拽，自带上下以及左右拖动进度条 |
| TFpsMonitor| FPS监控，监控软件性能相当重要 |
| TIcon| 提供了一套常用的图标集合，根据source不同自动加载 |
| TIconButton| 带有icon的按钮 |
| TImage| 显示一张图像，可以是Qt支持的所有格式 |
| TImageButton| 使用图像来制作一个按钮 |
| TInputField| 通过鼠标或键盘输入字符 |
| TLabel| 呈现文本给用户 |
| TMask| 遮罩功能，可以指定给用户显示某一特定区域 |
| TMouseArea| 接收并相应鼠标以及触控区域 |
| TNavigationBar| 为应用提供导航功能 |
| TObject| 在Qt基础上加了一丢丢小改善 |
| TPagination| 当数据量过多时，使用分页分解数据。 |
| TPopover| 模态任意位置弹出框 |
| TPopoverMenu| 模态任意位置弹出菜单框 |
| TPopup| 显示了一个弹出式窗口，需要自定义body |
| TProgressBar| 用于展示操作进度，告知用户当前状态和预期 |
| TRadioBox| 在一组备选项中进行单选 |
| TRadioBoxGroup| 管理一组RadioBox，组内只能选其一 |
| TRectangle| 矩形色块区域 |
| TSVGIcon| Svg 图标 |
| TScrollbarH| 横向滚动条，可操控ListView,GridView,Flickablet等等 |
| TScrollbarV| 竖向滚动条，可操控ListView,GridView,Flickablet等等 |
| TSwitch| 表示两种相互对立的状态间的切换，多用于触发「开/关」 |
| TTag| 用于标记和选择 |
| TToast| 轻量级的消息反馈，以小弹框的形式出现 |
| ...| 未完待续，请关注下一个版本的更新。 |

#  ::: 如何自定义主题

首先T2D的皮肤数据全部定义在 ini文件中，这些ini配置文件可以写在应用内也可以是应用的外部。通过修改ini节点属性及简单通用的规则即可实现完美的皮肤制作。

在Example中，我们为您配置了两款默认皮肤研究参考，没有皮肤的App是没有生命力的。

* [ini Theme详解](https://github.com/ShowFL/Toou-2D/wiki/如何制作theme)
* [参考Wiki 自制一套皮肤](https://github.com/ShowFL/Toou-2D/wiki/如何制作theme)

#  ::: 让你的组件也支持主题切换

TThemeBinder组件与主题样式数据绑定在一起。废话不说看代码，如下:

```
//!当主题发展改变，Rectangle也会改变他的 color , width
//!同时不会打破 width 的原有绑定
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

#  ::: 如何使用帮助文档

我们提供了在线与离线两种文档方式。离线文档支持Qt create(F1) 与 Qt Assistant

* [在线文档 http://oss.toou.net/docs/2d/index.html](http://oss.toou.net/docs/2d/index.html)
* [离线文档使用方法](https://github.com/ShowFL/Toou-2D/wiki/使用文档)

#  ::: 兼容性测试

| 平台 | 结果 | 平台 | 结果 | 平台 | 结果 |
| --- | --- | --- | --- | --- | --- |
| Windows 7 | OK | Windows 10 | OK | iOS iPad mini | OK |
| macOS 10.12 | OK | macOS 10.14 | OK | iOS iPhone XR | OK | 
| Android 华为 4.4| OK | Android 小米 7.0| OK | iOS iPhone 8 plus | OK |
| Android Mi Pad 8.0| OK | Android vivo 8.0| OK | iOS iPhone 6 | OK |
 
#  ::: 一张图读懂 Toou 2D

![](http://showfl.com/t2d.png)


#  ::: 值得一提的事情

**以前 Ctrl + C 过你们的代码，今天Toou也给了你们一个Ctrl + V 的机会。**

**[`Toou`](http://www.toou.net) 感谢关注，点个小星星呗！~**
