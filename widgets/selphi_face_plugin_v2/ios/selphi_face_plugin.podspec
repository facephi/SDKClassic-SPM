#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint selphi_face_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'selphi_face_plugin'
  s.version          = '1.0.1'
  s.summary          = 'Selphi plugin for Flutter.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage          = 'https://www.facephi.com'
  s.platform          = :ios, '10.0'
  s.license           = { :file => '../LICENSE' }
  s.author            = { 'Facephi' => 'support@facephi.com' }
  s.source            = { :git => '.' }
  # s.source_files      = 'Classes/**/*'
  
  s.source_files        = 'Classes/*.{h,m,swift}'
  s.public_header_files = 'Classes/*.h'

  s.vendored_frameworks = 'Frameworks/FPhiWidgetSelphi.xcframework', 'Frameworks/FPhiWidgetCore.xcframework', 'Frameworks/FPBExtractoriOS.xcframework'

  s.dependency 'zipzap'
  s.dependency 'Flutter'
  

  # Flutter.framework does not contain a i386 slice.
  # s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version     = '5.0'
  s.static_framework  = true
end
