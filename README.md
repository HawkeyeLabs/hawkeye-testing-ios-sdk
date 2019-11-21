# Hawkeye iOS SDK

The Hawkeye SDK gives you deep insights into how people use your apps, powered by the True Depth camera.

- Conduct eye tracking tests
- Add instructions and invite testers to participate in studies remotely
- Playback screen recordings showing where testers look
- View aggregated look, touch, and scroll heatmaps
- Simple integration - all it takes is 2 lines of code!

## How to Get Set Up

### 1. Download the SDK
You can download the SDK [here](). CocoaPods support is coming soon, but we're waiting on them to add support for XCFrameworks. For now, you'll have to install manually.

### 2. Add Hawkeye to your Xcode project
Navigate to the General section of your Xcode project’s settings and add Hawkeye.xcframework to Frameworks, Libraries, and Embedded Content.

### 3. Install Alamofire and SDWebImage
Because CocoaPods doesn’t support XCFrameworks yet, you’ll have to manually install Alamofire and SDWebImage, which the Hawkeye SDK is dependent upon. CocoaPods is the easiest way to install these dependencies. An example Podfile can be found in the example project included with the SDK.

### 4. Create an App project and start testing 🎉
Once you've installed the SDK, head to the [Hawkeye web dashboard](https://dashboard.usehawkeye.com), create a new project, and select the "app" test type.
