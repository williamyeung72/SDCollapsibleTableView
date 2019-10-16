#
# Be sure to run `pod lib lint SDCollapsibleTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDCollapsibleTableView'
  s.version          = '0.1.0'
  s.summary          = 'A Swift library that helps you collapse table view sections.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                   This CocoaPod provides the ability to easily setup a UITableView with
                   collapsible sections. This project is written purely in Swift 4.2.
                       DESC

  s.homepage         = 'https://github.com/williamyeung72/SDCollapsibleTableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'William Yeung' => 'william.yeung@relaxops.com' }
  s.source           = { :git => 'https://github.com/williamyeung72/SDCollapsibleTableView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SDCollapsibleTableView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SDCollapsibleTableView' => ['SDCollapsibleTableView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
