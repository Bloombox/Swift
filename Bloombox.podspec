
Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name          = "Bloombox"
  s.swift_version = "5.0"
  s.version       = "0.5.0-beta2"
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

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/bloombox/Swift.git", :tag => "#{s.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files = 'Sources/Client/*.swift'

  # ――― Dependencies ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.dependency 'OpenCannabis', '= 0.5.0-beta2'
  s.dependency 'BloomboxServices', '= 0.5.0-beta2'
  s.dependency 'SwiftProtobuf', '~> 1.5.0'
  s.dependency 'SwiftGRPC', '= 0.9.1'

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks  = "CoreLocation", "CoreBluetooth"
  s.libraries   = "z"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
  s.cocoapods_version = '>= 1.1.0'

end

