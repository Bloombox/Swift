
Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "Bloombox"
  s.version      = "0.0.9"
  s.summary      = "Client for Bloombox Cloud APIs"
  s.description  = <<-DESC
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
  #s.watchos.deployment_target = "2.0"
  #s.tvos.deployment_target = "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/bloombox/Swift.git", :tag => "#{s.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.subspec 'Schema' do |cs|
    cs.dependency 'SwiftProtobuf', '~> 1.1.2'
    cs.dependency 'SwiftGRPC', '~> 0.6.0'
    cs.source_files = 'Sources/Schema/*.swift'
  end

  s.subspec 'Client' do |cc|
    cc.dependency 'SwiftProtobuf', '~> 1.1.2'
    cc.dependency 'SwiftGRPC', '~> 0.6.0'
    cc.source_files = 'Sources/Client/*.swift'
  end

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks  = "CoreLocation", "CoreBluetooth"
  s.libraries   = "z"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
  s.cocoapods_version = '>= 1.1.0'

end

