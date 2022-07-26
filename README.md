<p align="center">              
<a href="https://img.shields.io/badge/License-MIT-green"><img src="https://img.shields.io/badge/License-MIT-green" alt="MIT License"></a>              
<a href="https://pub.dev/packages/easy_bar_style"><img src="https://img.shields.io/pub/v/easy_bar_style.svg?label=pub&color=orange" alt="pub version"></a>              
</p>              

# easy_bar_style

Set status bar style easily for each page

## Introduction
#### What is Easy bar Style?
Simple widget to set status bar style and system bar navigation style.
#### Why Easy bar style?
You don't need to use SystemChrome and you don't need to keep update the system ui overlay for each page, you can easily save the status bar style and system bar navigation style when user push to new page and the pop to previouse page all of this noisy logic hidden behing ```StatusBarStyle``` & ```SystemNavigationBarStyle``` widgets.

## Installation
 ```yaml              
dependencies:              
  easy_bar_style: [latest-version]              
              
```              


## StatusBarStyle
use this widget to set status bar color and icon brightness.

### Arguments:

| Name            |     Type             |     Description      |        Andoird       |         iOS         |
| :-------------  | :------------------: | :------------------: | :------------------: | :------------------:|
| color           |   Color?             | The color of the status bar   |          ✅          |          ❌          |
| brightness  |   Brightness?        | The brightness of the status bar icons, when it's null wil try to get the proper value from the given color |          ✅          |          ✅          |
| maintainState   |   bool               | Restort the style when pop again to the page, default true    |          ✅          |          ✅          |

 ```dart              
  @override
  Widget build(BuildContext context) {
    return StatusBarStyle(
      brightness: Brightness.dark,
      color: Colors.white60,
      maintainState: true,
      child: Container(color: Colors.red,),
    );
  }
```              

## SystemNavigationBarStyle
use this widget to set system navigation bar color and icon brightness.

### Arguments:

| Name            |     Type             |     Description      |        Andoird       |         iOS         |
| :-------------  | :------------------: | :------------------: | :------------------: | :------------------:|
| color           |   Color?             | The color of the system bottom navigation bar   |          ✅          |          ❌          |
| dividerColor    |   Color?             | The color of the divider between the system's bottom navigation bar and the app's content   |          ✅          |          ❌          |
| iconBrightness  |   Brightness?        | The brightness of the system navigation bar icons, when it's null wil try to get the proper value from the given color |          ✅          |          ❌          |
| maintainState   |   bool               | Restort the style when pop again to the page, default true    |          ✅          |          ❌          |
 ```dart              
  @override
  Widget build(BuildContext context) {
    return SystemNavigationBarStyle(
      brightness: Brightness.dark,
      color: Colors.deepOrangeAccent,
      maintainState: true,
      child: Container(color: Colors.red,),
    );
  }
```              

## EasyStyle
you can use the ```StatusBarStyle``` & ```SystemNavigationBarStyle``` togther using ```EasyStyle``` widget
```dart              
@override
  Widget build(BuildContext context) {
    return EasyStyle(
      styles: const [
        SystemNavigationBarStyle(
          color: Colors.brown,
          iconBrightness: Brightness.light,
        ),
        StatusBarStyle(
          color: Colors.red,
          brightness: Brightness.light,
        ),
      ],
      child: Container(color: Colors.green),
    );
   }
 ```
 
 instead of: 
 
 ```dart              
  @override
  Widget build(BuildContext context) {
    return SystemNavigationBarStyle(
      color: Colors.brown,
      iconBrightness: Brightness.light,
      child: StatusBarStyle(
        color: Colors.red,
        brightness: Brightness.light,
        child: Container(color: Colors.green),
      ),
    );
  } 
 ```
 
# Support
<p align="center">
<a href='https://ko-fi.com/U7U5E1983' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi3.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
</p>

 
 ### Developer

 - [Salah Nahed](https://twitter.com/salahamassi)
