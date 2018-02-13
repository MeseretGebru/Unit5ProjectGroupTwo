# Unit 5 - Project two [Group Two]
<img src=https://c4q-accesscode-4-3.slack.com/files/U74MZ76MR/F93FVUEN4/phlogger.png>

## Overview
Powered by Firebase, this app lets a user post their favorite pictures online, and gets comments and likes. The app has fetures to change a password and change the user's profile picture. This app can also show other peoples posts. It will also show how many upvotes the user gets.

## Gifs
|User login page|User Main post feed |
|:-------------:|:------------:|
|![loginscreen](https://user-images.githubusercontent.com/32072624/36167388-b60e5050-10c3-11e8-81c7-c0ad2bf00807.gif)|![globalfeedpost](https://user-images.githubusercontent.com/32072624/36167697-c2be1140-10c4-11e8-8e65-730c7834666c.gif)|

|User setting page|User profile page|
|:-------------:|:------------:|
|![settingprofile](https://user-images.githubusercontent.com/32072624/36167735-e3fce980-10c4-11e8-9067-f041e25bbf36.gif)|![userprofile](https://user-images.githubusercontent.com/32072624/36166959-30546b08-10c2-11e8-9822-f8689e8a3195.gif)|


|User creating a new post|Menu|
|:-------------:|:------------:|
|![creatingpost](https://user-images.githubusercontent.com/32072624/36167799-1a9e9d30-10c5-11e8-99e0-f1fa3922a969.gif)|![menu](https://user-images.githubusercontent.com/32072624/36167638-8f15fec0-10c4-11e8-9ed5-3db147858c1f.gif)|


## Features
- users can post pictures and texts
- users can like other peoples post
- users can see their all their posts
- users can change passoword
- users can upvote other's posts
- users can see how many upvots have

## Requirements
- iOS 8.0+ / Mac OS X 10.11+ / tvOS 9.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### CocoaPods
CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:

`$ sudo gem install cocoapods`

### Pods
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SnapKit](http://snapkit.io/docs/)
- [KingFisher](https://github.com/onevcat/Kingfisher)

```Pod
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
pod 'Alamofire',
pod 'SnapKit',
pod 'KingFisher'

end
```

Then, run the following command in Terminal:

`$ pod install`

## Database

### [Firebase](https://firebase.google.com)
Firebase is a platform that manages a backend for mobile applications. There are three main features that Firebase offers that we will take advantage of.

- Realtime database
- Authentication
- Image Hosting
```
FirebaseApp.configure()
```

## Pholggers
- **Project Manager**: Diego Beca-[GitHub](https://github.com/LtDangle)
- **Tech Lead**: Marlon Rugama - [GitHub](https://github.com/mrugama)
- **UI/UX**: Gloria Washington  - [GitHub](https://github.com)
- **QA**: Meseret Gebru - [GitHub](https://github.com/MeseretGebru)
- **Flex**: Xianxian Chen - [GitHub](https://github.com/XianxianChen)

