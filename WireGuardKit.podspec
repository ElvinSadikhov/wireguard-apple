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

  # Ensure the Go files and headers are included
  s.source_files = [
    'Sources/WireGuardKitC/**/*.{c,h}',
    'Sources/WireGuardKit/**/*.{swift}',
    'Sources/Shared/**/*.{c,h,swift}',
    'Sources/WireGuardNetworkExtension/**/*.{c,h,swift}'
  ]

  s.preserve_paths = [
    'Sources/WireGuardKitC/module.modulemap',
    'Sources/WireGuardKitGo/**/*'  # Preserve the entire Go module
  ]

  # Include the Go static library if it exists
  s.vendored_libraries = 'Sources/WireGuardKitGo/wg-go.a'  # Changed from xcframework to .a

  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => [
      '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitC',
      '${PODS_TARGET_SRCROOT}/Sources/WireGuardKit',
      '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitGo',
      '${PODS_TARGET_SRCROOT}/Sources/Shared',
      '${PODS_TARGET_SRCROOT}/Sources/WireGuardNetworkExtension'
    ].join(' '),
    'HEADER_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitGo',
    'LIBRARY_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/Sources/WireGuardKitGo',
    'OTHER_LDFLAGS' => '-force_load $(PODS_TARGET_SRCROOT)/Sources/WireGuardKitGo/wg-go.a'
  }
end
