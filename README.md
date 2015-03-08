JPHoliday
====
[![Version](https://img.shields.io/cocoapods/v/JPHoliday.svg)](http://cocoadocs.org/docsets/JPHoliday)
[![License](https://img.shields.io/cocoapods/l/JPHoliday.svg)](http://cocoadocs.org/docsets/JPHoliday)
[![Platform](https://img.shields.io/cocoapods/p/JPHoliday.svg)](http://cocoadocs.org/docsets/JPHoliday)

Swift library to deal with holidays in Japan.

## Usage

```swift
JPHoliday.isHoliday(year: 2016, month: 8, day: 11)

for holiday in JPHoliday.holidays(year: 2015) {
  println(holiday.name)
}
```

## Requirement

 - iOS 7.0+

## Install

### Cocoapods

Specify it in your Podfile:

```ruby
pod 'JPHoliday'
```

Then, run the following command:

```
$ pod install
```

### Manually

1. Clone this repository
2. Drag `JPHoliday.xcodeproj` to your project tree
3. Link `JPHoliday.framework` during your target's `Link Binary with Libraries` build phase

## Licence

[MIT](https://github.com/mako2x/JPHoliday/blob/master/LICENSE)

## Author

[mako2x](https://github.com/mako2x)
