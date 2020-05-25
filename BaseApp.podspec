Pod::Spec.new do |spec|
  spec.name         = "BaseApp"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of BaseApp."
  spec.description  = "A short description of BaseApp."
  spec.homepage     = "https://github.com/achuaswani/BaseApp.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Aswani" => "achuaswani.g@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/achuaswani/BaseApp.git", :tag => spec.version }
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

end
