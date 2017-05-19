# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'

target 'GoalsApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GoalsApp
  pod 'Charts', '~> 3.0.1'
  pod 'RealmSwift', '~> 2.7.0'
  pod 'SearchTextField', '~> 1.0.2'
  pod 'Siesta', '~> 1.0'
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
          end
      end
  end
  
  target 'GoalsAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
