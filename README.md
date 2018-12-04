# PickerController

[![CI Status](http://img.shields.io/travis/wonderbear/PickerController.svg?style=flat)](https://travis-ci.org/wonderbear/PickerController) [![Version](https://img.shields.io/cocoapods/v/PickerController.svg?style=flat)](http://cocoapods.org/pods/PickerController) [![Platform](https://img.shields.io/cocoapods/p/PickerController.svg?style=flat)](http://cocoapods.org/pods/PickerController)
[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![License](https://img.shields.io/cocoapods/l/PickerController.svg?style=flat)](http://cocoapods.org/pods/PickerController)

PickerController, can make correlational pick. I love it.

![PickerController](/ScreenShot/PickerController.gif "PickerController")

## Contents

- [Features](#features)
- [Requirements](#requirements)
- [Example](#example)
- [Installation](#installation)
- [Usage](#usage)
- [Properties](#properties)
- [Author](#author)
- [License](#license)

## Features

- [x] Correlational picker support
- [x] Group picker support
- [x] Date picker support

## Requirements

- iOS 8.0+ / Mac OS X 10.11+ / tvOS 9.0+
- Xcode 8.0+
- Swift 4.2+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate PickerController into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'PickerController', '~> 0.1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate PickerController into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "xiongxiong/PickerController" ~> 0.1.0
```

Run `carthage update` to build the framework and drag the built `PickerController.framework` and `SwiftyJSON.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate PickerController into your project manually.

## Example

Open the example project, build and run.

## Usage

### Extension of UIViewController
```swift
extension UIViewController {

    public func showCorrelationPicker(title:String, correlationalJsonStr: String, selectedItems: [String], onDone: ClosureDone? = nil, onCancel: ClosureCancel? = nil) {
        ...
    }

    public func showCorrelationPicker(title:String, correlationalJsonStr: String, selectedIndices: [Int], onDone: ClosureDone? = nil, onCancel: ClosureCancel? = nil) {
        ...
    }

    public func showCorrelationPicker(title:String, correlationalJsonFile: String, selectedItems: [String], onDone: ClosureDone? = nil, onCancel: ClosureCancel? = nil) {
        ...
    }

    public func showCorrelationPicker(title:String, correlationalJsonFile: String, selectedIndices: [Int], onDone: ClosureDone? = nil, onCancel: ClosureCancel? = nil) {
        ...
    }

    public func showGroupPicker(title:String, groupData: [[String]], selectedItems: [String], onDone: ClosureDone? = nil, onCancel: ClosureCancel? = nil) {
        ...
    }

    public func showGroupPicker(title:String, groupData: [[String]], selectedIndices: [Int], onDone: ClosureDone? = nil, onCancel: ClosureCancel? = nil) {
        ...
    }

    public func showDatePicker(title: String, initialDate: Date, onDone: ClosureDateDone? = nil, onCancel: ClosureCancel? = nil) {
        ...
    }
}
```

### Chinese Region Picker

```swift
extension UIViewController {

    public func showPicker_ChineseRegionalism(title: String, selectedItems: [String], onDone: ClosureDone? = nil, onCancel: ClosureCancel? = nil) {
        ...
    }
}
```

### Use PickerController

```swift
func onClicked_button1() {
        let data = [["1983", "1984", "1985"], ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]]
        showGroupPicker(title: "Hello", groupData: data, selectedItems: ["1984", "6月"], onDone: { [unowned self] (indices, items) in
            self.labelIndices.text = "indices -- \(indices)"
            self.labelItems.text = "items -- \(items)"
            }, onCancel: {
               self.labelIndices.text = "selected nothing"
                self.labelItems.text = "selected nothing"
        })
}

func onClicked_button2() {
        showPicker_ChineseRegionalism(title: "城市", selectedItems: ["江苏", "无锡"], onDone: { [unowned self] (indices, items) in
            self.labelIndices.text = "indices -- \(indices)"
            self.labelItems.text = "items -- \(items)"
            }, onCancel: {
                self.labelIndices.text = "selected nothing"
                self.labelItems.text = "selected nothing"
        })
}

func onClicked_button3() {
        showDatePicker(title: "时间", initialDate: Date(), onDone: { [unowned self] (date) in
            self.labelIndices.text = ""
            self.labelItems.text = "date -- \(date)"
            }, onCancel: {
                self.labelIndices.text = ""
                self.labelItems.text = "selected nothing"
        })
}
```

## Properties

- height: CGFloat // height of picker in PickerController
- animationDuration: TimeInterval // animation duration of picker
- backgroundAlpha: CGFloat // background alpha of PickerController

## Author

xiongxiong, ximengwuheng@163.com

## License

PickerController is available under the MIT license. See the LICENSE file for more info.
