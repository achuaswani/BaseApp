#
#  Be sure to run `pod spec lint BaseApp.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Create Base of app which includes login logout and other features
  #

  spec.name         = "BaseApp"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of BaseApp."

 
  spec.description  = "A short description of BaseApp."

  spec.homepage     = "https://github.com/achuaswani/BaseApp.git"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Aswani" => "achuaswani.g@gmail.com" }
  # spec.platform     = :ios
  # spec.platform     = :ios, "5.0"

  spec.source       = { :git => "https://github.com/achuaswani/BaseApp.git", :tag => "#{spec.version}" }
  spec.dependency 'Fabric', '~> 1.10.2'
  spec.dependency  'Crashlytics', '~> 3.14.0'
  spec.static_framework = true
  
  # Pod for Google Analytics
  spec.dependency  'Firebase/Firestore'
  spec.dependency  'Firebase/Analytics'
  spec.dependency  'Firebase/Auth'
  spec.dependency  'SwiftyJSON'
  spec.dependency  'Alamofire'
  spec.source_files  = "BaseApp", "BaseApp/**/*.{swift}"
  spec.exclude_files = "Classes/Exclude"

end
