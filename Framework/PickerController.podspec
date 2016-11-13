#
# Be sure to run `pod lib lint ActionCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PickerController'
  s.version          = '0.1.0'
  s.summary          = 'PickerController, has many functions.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
PickerController, has many functions. I love it.
                       DESC

  s.homepage         = 'https://github.com/xiongxiong/PickerController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xiongxiong' => 'xiongxiong0619@gmail.com' }
  s.source           = { :git => 'https://github.com/xiongxiong/PickerController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Framework/PickerController/**/*'

  # s.resource_bundles = {
  #   'PickerController' => ['PickerController/Assets/*.png']
  # }

  s.public_header_files = 'Framework/PickerController/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'SwiftyJSON', '~> 3.0'
end
