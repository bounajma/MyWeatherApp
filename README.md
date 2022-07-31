# MyWeatherApp

Weather Forecast is a simple weather app, that show the current weather of any city around the world.
The user can add any city he wants, the app will take care of geolocating it and displaying it.
Any city the users adds is saved locally in order to use it in offline mode.

# Architecture

The App is basically based on the MVVM Architecture. For binding we just used closure callbacks with didSet.

# Next Step

Imlementing [RxSwift] (https://github.com/ReactiveX/RxSwift).

# How to build

1) Clone the repository

```bash
$ git clone https://github.com/bounajma/MyWeatherApp.git
```

2) Install pods

```bash
$ cd MyWeatherApp
$ pod install
```

3) Open the workspace in Xcode

```bash
$ open "MyWeatherApp.xcworkspace"
```
```bash
 
5) Compile and run the app in your simulator

# Requirements

* Xcode 13
* iOS 11+
* Swift 5

# Libraries

* [MBWeather] (https://github.com/bounajma/MBWeather)
