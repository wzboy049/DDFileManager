#
# Be sure to run `pod lib lint DDFileManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DDFileManager'
  s.version          = '0.1.0'
  s.summary          = 'a wraper of NSFileManager.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'a wraper of NSFileManager'

  s.homepage         = 'https://github.com/wzboy049/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wzboy' => '542617180@qq.com' }
  s.source           = { :git => 'https://github.com/wzboy049/DDFileManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DDFileManager/Classes/**/*'
  
   s.resource_bundles = {
     'DDFileManager' => ['DDFileManager/Assets/*.png']
   }

  #s.public_header_files = 'Pod/Classes/DDFileManager.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
