Pod::Spec.new do |s|
  s.name             = 'XTabBar'
  s.version          = '1.0.0'
  s.summary          = 'XTabBar is a little Swift pod that customize tab bar in iPhone X'
 
  s.description      = <<-DESC
XTabBar is a little Swift pod that customize tab bar for iPhone X. It has few themes that have curvy corners to fit in iPhone X design. 
                       DESC
 
  s.homepage         = 'https://github.com/yagiz/XTabBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yagiz' => 'yagizgurgul@gmail.com' }
  s.source           = { :git => 'https://github.com/yagiz/XTabBar.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'Classes/**/*.{swift}'
 
end