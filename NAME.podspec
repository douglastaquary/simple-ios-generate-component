Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '1.0.0'
  s.summary          = 'A short description of ${POD_NAME}.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/${USER_NAME}/${POD_NAME}'
  s.platforms        = { :ios => "${POD_VERSION}" }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '${USER_NAME}' => '${USER_EMAIL}' }
  s.source           = { :git => 'https://github.com/${USER_NAME}/${POD_NAME}.git', :tag => s.version.to_s }

  
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.3' 
  s.pod_target_xcconfig = { 'ENABLED_BITCODE' => 'NO', 'SKIP_INSTALL' => 'NO', 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }

  s.default_subspec = 'Release'
  s.subspec 'Release' do |release|
    release.vendored_frameworks = "${POD_NAME}.xcframework"
  end
  

  s.subspec 'Debug' do |debug|
    debug.source_files = '#{POD_NAME}/Classes/**/*.{h,m,swift}'
    debug.resources = '${POD_NAME}/Assets/**/*',
                      '${POD_NAME}/Classes/**/*.{xib,json,ttf,png,strings,xcassets,storyboard}'

    debug.test_spec 'Tests' do |test_spec|
      test_spec.test_type = :unit
      test_spec.source_files = '#{POD_NAME}/Tests/**/*.swift'
      test_spec.resources = '${POD_NAME}/Tests/**/*.{xib,json,ttf,png,strings,xcassets,storyboard}'
    end
    debug.test_spec 'UITests' do |test_spec|
      test_spec.test_type = :ui
      test_spec.source_files = '#{POD_NAME}/UITests/**/*.swift'
    end
    # debug.dependency 'AFNetworking'

  end
end
