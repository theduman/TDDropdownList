Pod::Spec.new do |s|
  s.name             = 'TDDropdownList'
  s.version          = '1.0.2'
  s.summary          = 'Easy to use, customizable dropdown list for ios.Written in swift3'

  s.description      = <<-DESC
'Easy to use, customizable dropdown list for ios.Written in swift3'
                       DESC

  s.homepage         = 'https://github.com/theduman/TDDropdownList'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Emre' => 'emreduman16@gmail.com' }
  s.source           = { :git => 'https://github.com/theduman/TDDropdownList.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'TDDropdownList/TDDropdownList.swift'

end
