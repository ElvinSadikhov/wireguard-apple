Pod::Spec.new do |s|
  s.name             = 'WireGuardKit'
  s.version          = '1.0.15-27'
  s.summary          = 'WireGuard implementation for Apple devices'
  s.homepage         = 'https://github.com/ElvinSadikhov/wireguard-apple'
  s.license          = { :type => 'MIT' }
  s.author           = { 'ElvinSadikhov' => 'your.email@example.com' }
  s.source           = { :git => 'https://github.com/ElvinSadikhov/wireguard-apple.git', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'
  s.swift_version = '5.7'

  # ✅ Ensure only iOS source files are included
  s.source_files = 'Sources/**/*.{swift,h,m,c,go}', 
                   'Sources/WireGuardApp/UI/iOS/**/*.{swift,h,m,c}' # Include only iOS UI files

  # ❌ Exclude macOS-specific files
  s.exclude_files = 'Sources/WireGuardApp/UI/macOS/**/*.{swift,h,m,c}'

  # ✅ Preserve everything else
  s.preserve_paths = 'Sources/**/*'
  
  s.vendored_libraries = 'Sources/WireGuardKitGo/wg-go.a'

  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => '${PODS_TARGET_SRCROOT}/Sources/**',
    'HEADER_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitGo',
    'LIBRARY_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitGo',
    'OTHER_LDFLAGS' => '-force_load $(PODS_TARGET_SRCROOT)/Sources/WireGuardKitGo/wg-go.a'
  }
end
