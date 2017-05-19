Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.3'
s.name = "ios_core"
s.summary = "Library for creating interactive apps"
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Jiri Rychlovsky" => "rychljir@gmail.com" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/rychljir/ios_core"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/rychljir/ios_core.git", :tag => "#{s.version}"}

# For example,
# s.source = { :git => "https://github.com/rychljir/ios_core.git", :tag => "#{s.version}"}


# 7
s.framework = "UIKit"
s.dependency 'AEXML'
s.dependency 'PureLayout'
s.dependency 'DLRadioButton'
s.dependency 'DragDropUI'

# 8
s.source_files = "ios_core/**/*.{swift}"

# 9
s.resources = "ios_core/**/*.{png,jpeg,jpg,storyboard,xib}"
end
