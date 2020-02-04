#
# Be sure to run `pod lib lint SwiftyGKRTree.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyGKRTree'
  s.version          = '0.1.0'
  s.summary          = "A Swifty wrapper for GameKit's R-Tree data structure"

  s.description      = <<-DESC
GameKit's RTree class only accepts NSObject subclasses.
This small library aims to provide conveniences to make
GKRTree deal with any Swift type, while maintaining correct behavior.
                       DESC

  s.homepage         = 'https://github.com/ahmedk92/SwiftyGKRTree'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ahmedk92' => 'ahmedkhalaf.92@gmail.com' }
  s.source           = { :git => 'https://github.com/ahmedk92/SwiftyGKRTree.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ahmedkhalaf_92'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'SwiftyGKRTree/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftyGKRTree' => ['SwiftyGKRTree/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
