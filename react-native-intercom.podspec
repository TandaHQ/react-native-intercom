require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = 'react-native-intercom'
  s.version      = package['version'].sub('-beta', '')
  s.license      = { :type => 'MIT' }
  s.homepage     = package['homepage']
  s.authors      = package['contributors'].flat_map { |author| { author['name'] => author['email'] } }
  s.summary      = package['description']
  s.source       = { :git => package['repository']['url'] }
  s.source_files = 'iOS/*.{h,m}'
  s.platform     = :ios, '8.0'
  s.frameworks   = [ "Intercom" ]
  s.static_framework = true
  s.dependency 'React-Core' # This converts this package to work with react-native 0.60+
  s.dependency 'Intercom', '~> 5.0'
end
