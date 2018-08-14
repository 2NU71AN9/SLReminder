
Pod::Spec.new do |s|

s.name         = "SLReminder"
s.version      = "1.0.3"
s.swift_version  = "4.1"
s.summary      = "提示"
s.description  = "仿QQ的从屏幕上方弹出提示内容"
s.homepage     = "https://github.com/2NU71AN9/SLReminder" #项目主页，不是git地址
s.license      = { :type => "MIT", :file => "LICENSE" } #开源协议
s.author       = { "孙梁" => "1491859758@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/2NU71AN9/SLReminder.git", :tag => "v#{s.version}" } #存储库的git地址，以及tag值
s.source_files  =  "SLReminder/Reminder/*.{swift}" #需要托管的源代码路径
s.resources     = 'SLReminder/Reminder/Reminder.bundle'
s.requires_arc = true #是否支持ARC
s.dependency "pop"

end
