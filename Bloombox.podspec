
Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name          = "Bloombox"
  s.version       = "0.5.0-beta5"
  s.summary       = "Client for Bloombox Cloud APIs"
  s.description   = <<-DESC
Native Swift client for accessing Bloombox Cloud APIs
                   DESC
  s.homepage     = "https://github.com/Bloombox/Swift"
  s.documentation_url = "https://bloombox.github.io/Swift/"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE.txt" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.authors             = { "Sam Gammon" => "sam@bloombox.io" }
  s.social_media_url    = "https://twitter.com/bloomboxIO"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "10.0"
  s.watchos.deployment_target = "4.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/bloombox/Swift.git", :tag => "#{s.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files = 'Sources/Client/*.swift'
  s.swift_versions = ['3.2', '4.0', '4.2', '5.0']

  # ――― Dependencies ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.dependency 'OpenCannabis', '= 0.5.0-beta5'
  s.dependency 'BloomboxServices', '= 0.5.0-beta5'
  s.dependency 'SwiftProtobuf', '~> 1.7.1'
  s.dependency 'SwiftGRPC', '= 0.9.2'

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks  = "CoreLocation", "CoreBluetooth"
  s.libraries   = "z"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
  s.cocoapods_version = '>= 1.1.0'

end

