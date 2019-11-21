![Header Image](https://more-web.s3-us-west-1.amazonaws.com/ios-sdk-beta-header.png)

# Hawkeye iOS SDK
The Hawkeye SDK gives you deep insights into how people use your apps, powered by the TrueDepth camera.

- 👀 Conduct eye tracking tests
- 📝 Add instructions and invite testers to participate in studies remotely
- 🎥 Playback screen recordings showing where testers look
- 🔥 View aggregated look, touch, and scroll heatmaps
- ✅ Simple integration - all it takes is 2 lines of code!

## Install the SDK

#### 1. Download the SDK
You can download the SDK [here](). CocoaPods support is coming soon, but we're waiting on them to add support for XCFrameworks. For now, you'll have to install manually.

#### 2. Add Hawkeye to your Xcode project
Navigate to the General section of your Xcode project’s settings and add `Hawkeye.xcframework` to `Frameworks, Libraries, and Embedded Content`.

#### 3. Install Alamofire and SDWebImage
Because CocoaPods doesn’t support XCFrameworks yet, you’ll have to manually install `Alamofire` and `SDWebImage`, which the Hawkeye SDK is dependent upon. CocoaPods is the easiest way to install these dependencies. An example Podfile can be found in the example project included with the SDK.

## How to Get Set Up

#### 1. Create an App project
Once you've installed the SDK, head to the [Hawkeye web dashboard](https://dashboard.usehawkeye.com), create a new project, and select the "app" test type.

#### 2. Set up Hawkeye in your AppDelegate
Add the following 2 lines of code to your AppDelegate. You'll be given your `SDK Token` and `App ID` when you create an app project on the Hawkeye dashboard.

```swift
import Hawkeye

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions 
    launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool 
  {

    // 1. Set your Hawkeye token and app ID
    Hawkeye.setToken("SDK TOKEN GOES HERE", appID: "APP ID GOES HERE")
      
    return true
  }

  func application(_ app: UIApplication, open url: URL, 
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool 
  {

    // 2. Notify Hawkeye when your app is opened by a URL 
    return Hawkeye.appDidOpenWithURL(url)

  }
}
```

#### 3. Add the Hawkeye URL scheme
In order to invite testers using links, you need to add the Hawkeye URL scheme to your app. In Xcode, navigate to your project settings and select your app in the list of targets. Then, open the Info section and locate the URL Types section. Add a new type and set the identifier and URL scheme values to `hk-APP_ID`. Repalce `APP_ID` with the value used in the previous step.

![URL Scheme Example](https://more-web.s3-us-west-1.amazonaws.com/URLExample.png)

#### 4. Add Camera and Microphone Permissions
Hawkeye uses the camera and microphone to record tests. This means you need to add descriptions explaining how these permissions are used.

![Info.plist Example](https://more-web.s3-us-west-1.amazonaws.com/PlistExample.png)
Open your `Info.plist` file and add the `NSCameraUsageDescription` and `NSMicrophoneUsageDescription` keys to the file. If your app already includes values for these keys, you don’t need to change anything. Otherwise, you can use these examples:

  `NSCameraUsageDescription` Hawkeye uses the camera to track where you look during research studies.

  `NSMicrophoneUsageDescription` Hawkeye uses the microphone to record what you say during research studies.
  
#### 5. Run your app 🎉
If everything worked, open your app project on the Hawkeye dashboard and you’ll see a confirmation message.

## Feedback
We'd love to hear what you think! If you've got any feature requests, bugs, or general feedback, please let us know. **Either email us at [support@usehawkeye.com](support@usehawkeye.com) or hit the chat button on the Hawkeye dashboard.**

## Beta Goals
Here are a few questions to keep in mind while you try out the SDK:
- How well do heatmaps work?
- Has integrating the SDK had any impact on your core app experience? If so, what? 
- Is explicitly inviting testers useful or would you prefer Hawkeye collect analytics in the background?
- Are there other ways you'd like to recruit testers? Push notifications? Integrations with tools like Intercom? In app promos?
- Would you find value in offering test participants a discount code / Amazon gift card to incentivize participation?
- Do you have hesitations around the privacy concerns associated with adding Hawkeye to your app?

Let us know what you think either by [emailing us](support@usehawkeye.com) or by filling out [this survey](https://usehawkeye.typeform.com/to/UmCtia).

## License & Copyright

Copyright © 2019 Hawkeye Labs, Inc. All rights reserved. Licensed under Apache-2.0. See LICENSE for more details. By using this SDK, you are also agreeing to the Hawkeye [Terms of Service](https://usehawkeye.com/terms) and [Privacy Polciy](https://usehawkeye.com/privacy).
