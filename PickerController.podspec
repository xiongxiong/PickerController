#
# Be sure to run `pod lib lint PickerController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PickerController'
  s.version          = '0.1.2'
  s.summary          = 'PickerController, has many functions.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
PickerController, can make correlational pick. love it.
                       DESC

  s.homepage         = 'https://github.com/xiongxiong/PickerController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xiongxiong' => 'xiongxiong0619@gmail.com' }
  s.source           = { :git => 'https://github.com/xiongxiong/PickerController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PickerController/Classes/**/*.swift'
  s.resources = 'PickerController/Assets/**/*.json'

  # s.resource_bundles = {
  #   'PickerController' => ['PickerController/Assets/**/*.json']
  # }

  # s.public_header_files = 'PickerController/Classes/**/*.h'
  s.frameworks = 'UIKit'
end

