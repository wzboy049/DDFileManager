#
# Be sure to run `pod lib lint DDFileManager.podspec' to ensure this is a
# valid spec before submitting.


Pod::Spec.new do |s|
  s.name             = 'DDFileManager'
  s.version          = '0.1.3'
  s.summary          = 'a wraper of NSFileManager.'
  s.homepage         = 'https://github.com/wzboy049/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wzboy' => '542617180@qq.com' }
  s.platform     = :ios, '8.0'
  s.source           = { :git => 'https://github.com/wzboy049/DDFileManager.git', :tag => s.version.to_s }
  s.source_files = 'DDFileManager/Classes/**/*.{h,m}'
  s.resource = 'DDFileManager/DDFileManager.bundle'
  s.requires_arc = true


  # s.ios.deployment_target = '8.0'
  #s.public_header_files = 'Pod/Classes/DDFileManager.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

end
