#
# Be sure to run `pod lib lint Hawkeye.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Hawkeye'
  s.version          = '0.0.1'
  s.summary          = 'The Hawkeye SDK uses eye tracking to give you deep insights into how people use your iOS apps. Powered by the TrueDepth camera.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  The Hawkeye SDK gives you deep insights into how people use your apps, powered by the TrueDepth camera.

  👀 Conduct eye tracking tests
  📝 Add instructions and invite testers to participate in studies remotely
  🎥 Playback screen recordings showing where testers look
  🔥 View aggregated look, touch, and scroll heatmaps
  ✅ Simple integration - all it takes is 2 lines of code!
                       DESC

  s.homepage         = 'https://github.com/matthewmoss/hawkeye-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Commercial', :file => 'LICENSE' }
  s.author           = { 'matthewmoss' => 'matt@usehawkeye.com' }
  s.source           = { :git => 'https://github.com/matthewmoss/hawkeye-ios-sdk.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/usehawkeye'

  s.ios.deployment_target = '8.0'
  s.swift_versions = '5.0'

  s.vendored_frameworks = 'Hawkeye.xcframework'
  s.frameworks = 'ARKit'
  s.dependency 'Alamofire', '~> 4.7'
  s.dependency 'SDWebImage', '~> 4.0'
end
