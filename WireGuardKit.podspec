Pod::Spec.new do |s|
  s.name             = 'WireGuardKitTest'
  s.version          = '1.0.15-27'
  s.summary          = 'WireGuard implementation for Apple devices'
  s.homepage         = 'https://github.com/ElvinSadikhov/wireguard-apple'
  s.license          = { :type => 'MIT' }
  s.author           = { 'ElvinSadikhov' => 'your.email@example.com' }
  s.source           = { :git => 'https://github.com/ElvinSadikhov/wireguard-apple.git', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'

  # Make sure this path is correct and the framework exists
  s.vendored_frameworks = 'Sources/WireGuardKitGo/wg-go.xcframework'
  s.swift_version = '5.7'

  s.source_files = [
    'Sources/WireGuardKitC/**/*.{c,h}',
    'Sources/WireGuardKit/**/*.{swift}',
    'Sources/Shared/**/*.{c,h,swift}',
    'Sources/WireGuardKitGo/wireguard.h',
    'Sources/WireGuardNetworkExtension/**/*.{c,h,swift}'
  ]

  s.preserve_paths = [
    'Sources/WireGuardKitC/module.modulemap',
    'Sources/WireGuardKitGo/wg-go.xcframework/**/*'  # Add this line
  ]

  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => [
      '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitC',
      '${PODS_TARGET_SRCROOT}/Sources/WireGuardKit',
      '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitGo',
      '${PODS_TARGET_SRCROOT}/Sources/Shared',
      '${PODS_TARGET_SRCROOT}/Sources/WireGuardNetworkExtension'
    ].join(' '),
    'HEADER_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitGo',
    'FRAMEWORK_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitGo',  # Add this line
    'APPLICATION_EXTENSION_API_ONLY' => 'YES'
  }
end
