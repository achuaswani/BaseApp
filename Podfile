# Uncomment the next line to define a global platform for your project
  platform :ios, '9.0'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
def all_pods
  # Pods for Crash reporting
   pod 'Firebase/Crashlytics'
   # Pod for Google Analytics
   pod 'Firebase/Core'
   pod 'Firebase/Firestore'
   pod 'Firebase/Analytics'
   pod 'Firebase/Auth'
   pod 'SwiftyJSON'
   pod 'Alamofire'
   pod 'SwiftLint'
end
target 'BaseApp' do
  # Pods for BaseApp
  all_pods
 
end
target 'BaseAppTests' do
  inherit! :search_paths
  # Pods for testing
  all_pods
end

target 'BaseAppUITests' do
  inherit! :search_paths
  # Pods for testing
  all_pods
end
