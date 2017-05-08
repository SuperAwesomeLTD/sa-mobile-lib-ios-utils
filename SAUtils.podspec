# Be sure to run `pod lib lint SAUtils.podspec --allow-warnings' to ensure this is a

Pod::Spec.new do |s|
  s.name             = "SAUtils"
  s.version          = "1.5.1"

  s.summary          = "General collection of SuperAwesome Utility functions for iOS"
  s.description      = <<-DESC
		       SAUtils is a library containing network and utility functions needed by the SDK.
                       DESC
  s.homepage         = "https://github.com/SuperAwesomeLTD/sa-mobile-lib-ios-utils"
  s.license          = { :type => "GNU GENERAL PUBLIC LICENSE Version 3", :file => "LICENSE" }
  s.author           = { "Gabriel Coman" => "gabriel.coman@superawesome.tv" }
  s.source           = { :git => "https://github.com/SuperAwesomeLTD/sa-mobile-lib-ios-utils.git", :tag => "1.5.1" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.frameworks = 'SystemConfiguration'
end
