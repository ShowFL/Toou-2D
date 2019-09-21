# Toou 2D  拿来即用，为简单而生。

![](https://img.shields.io/badge/Version-1.0-red?style=for-the-badge) ![](https://img.shields.io/badge/Build-passing-green?style=for-the-badge) ![](https://img.shields.io/badge/License-MIT-green?style=for-the-badge) [![](https://img.shields.io/badge/EN-英文传送门-blue?style=for-the-badge)](https://github.com/ShowFL/Toou-2D/blob/master/README.md)

以下简称T2D，由[`Toou`](http://www.toou.net)团队精心打造的Qt(quick) 2D轻量级框架，代码采用自身接口规范编写，它可以免费用于商业软件和开源项目。简洁的代码结构易于扩展与修改，完美地兼顾了应用的性能与动态性，解决组件少、体积大、没有主题包的问题。T2D使用门槛极低可`拿来即用`无需深入学习。从核心代码到组件Api的每一处细节都经过精心设计，非常适合应用程序界面`快速开发`

## ::: 有哪些优点

1. 几十个组件来满足您不同的开发需求
2. 支持动态库、静态库多模式编译
3. 无需任何环境设置即可自动安装Qml插件
4. 所有组件都支持主题特性
5. 可以在INI文件中轻松配置主题
6. 主题切换组件高效运行
7. 更好的性能与Toou2D没有控制和控制s2
8. 支持Font Awesome，Svg图标
9. 丰富的Demos供学习和参考T2D更容易上手
10. 支持使用本地API文档和网络API文档
11. 规划一个长期的开源路线长期维护
12. 继承Qt跨平台特性并遵循Qt语法规范
13. 让我们一起创建一个美好的明天  ：）

## ::: 使用Toou2D 开发的Demo 效果

![](http://oss.toou.net/github-resources/2d/preview.gif) ![](http://oss.toou.net/github-resources/2d/preview_musicplayer.gif)

* [更多Demo下载地址](https://github.com/ShowFL/Toou-2D/wiki/demos_cn)

##  ::: 运行 Example 快速开始

> 需要Qt 5.6 或更高版本。
> 1. 将项目clone到本地 使用Qt creator 打开 Toou-2D.pro
> 2. 构建 （先构建后运行）
> 3. 运行。即可看到demo预览效果。

*支持 macOS ,Windows 构建，可发布到 macOS,Windows,iOS,Android等多平台。*

* [iOS 使用特殊细节](https://github.com/ShowFL/Toou-2D/wiki/problems_cn)
* [高级构建方法](https://github.com/ShowFL/Toou-2D/wiki/build_cn)

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
| TInputField| 接收鼠标或键盘输入字符 |
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

#  ::: 如何制作主题包

T2D主题数据全部定义在ini文件中，这些ini文件配置可以写在应用程序内部或者是外部。通过修改ini节点属性及简单通用的规则即可实现主题制作。

在Example中，我们为您配置了两款默认主题包研究参考，没有主题皮肤的应用程序是没有生命力的。

* [如何制作主题包](https://github.com/ShowFL/Toou-2D/wiki/theme_cn)

#  ::: 让你的组件也支持主题切换

TThemeBinder可以让组件与主题样式数据绑定在一起，如下:

```
//!当主题发展改变，Rectangle也会改变他的 color , width
//!同时不会打破 Rectangle 的原有绑定
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

* [高级玩法](https://github.com/ShowFL/Toou-2D/wiki/theme_cn)

#  ::: 如何使用帮助文档

我们提供了在线与离线两种文档方式。离线文档支持Qt create(F1) 与 Qt Assistant

* [在线文档 http://www.toou.net/docs/2d/](http://www.toou.net/docs/2d/)
* [离线文档使用方法](https://github.com/ShowFL/Toou-2D/wiki/document_cn)

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
