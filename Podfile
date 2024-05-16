# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

def service_pods
  pod 'Moya/RxSwift'
  pod 'Moya-ObjectMapper'
  pod 'Moya-ObjectMapper/RxSwift'
  pod 'RxSwift'
end

def ui_pods
  pod 'Kingfisher', '~> 7.0'
end

target 'NeversitupTest' do
  use_frameworks!

  # Pods for NeversitupTest
  service_pods
  ui_pods

  target 'NeversitupTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NeversitupTestUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
