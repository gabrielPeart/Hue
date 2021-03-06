Pod::Spec.new do |s|
  s.name             = "Hue"
  s.summary          = "The all-in-one coloring utility that you'll ever need."
  s.version          = "1.0.0"
  s.homepage         = "https://github.com/hyperoslo/Hue"
  s.license          = 'MIT'
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = { :git => "https://github.com/hyperoslo/Hue.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = '8.0'

  s.requires_arc = true
  s.ios.source_files = 'Source/iOS/**/*'

  s.ios.frameworks = 'UIKit'
end
