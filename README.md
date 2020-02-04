# SwiftyGKRTree

[![CI Status](https://img.shields.io/travis/ahmedk92/SwiftyGKRTree.svg?style=flat)](https://travis-ci.org/ahmedk92/SwiftyGKRTree)
[![Version](https://img.shields.io/cocoapods/v/SwiftyGKRTree.svg?style=flat)](https://cocoapods.org/pods/SwiftyGKRTree)
[![License](https://img.shields.io/cocoapods/l/SwiftyGKRTree.svg?style=flat)](https://cocoapods.org/pods/SwiftyGKRTree)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyGKRTree.svg?style=flat)](https://cocoapods.org/pods/SwiftyGKRTree)

## Why

GameKit's [RTree class](https://developer.apple.com/documentation/gameplaykit/gkrtree) only accepts `NSObject` subclasses.
This small library aims to provide conveniences to make GKRTree deal with any Swift type, while maintaining correct behavior.

## Why use an R-Tree?
R-Trees offer efficient data lookup within a rectangle.
There are uses cases for this.
The one I specifically wrote this wrapper for is storing data for retrieval for `CATiledLayer`s. 


## Installation

SwiftyGKRTree is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftyGKRTree'
```

## Author

ahmedk92, ahmedkhalaf.92@gmail.com

## License

SwiftyGKRTree is available under the MIT license. See the LICENSE file for more info.
