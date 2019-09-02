#
# Be sure to run `pod lib lint SGBaseModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SGBaseModule'
    s.version          = '1.0.0.1'
    s.summary          = 'A short description of SGBaseModule.'
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/GuiLQing/SGBaseModule.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'GuiLQing' => 'gui950823@126.com' }
    s.source           = { :git => 'https://github.com/GuiLQing/SGBaseModule.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '9.0'
    
    s.source_files = 'SGBaseModule/Classes/*.{h,m}'
    
    s.subspec 'SGBarButtonItem' do |barButtonItem|
        barButtonItem.source_files = 'SGBaseModule/Classes/SGBarButtonItem/**/*.{h,m}'
    end
    
    s.subspec 'SGNavigationController' do |navigationController|
        navigationController.source_files = 'SGBaseModule/Classes/SGNavigationController/**/*.{h,m}'
        navigationController.dependency 'SGBaseModule/SGBarButtonItem'
    end
    
    s.subspec 'SGView' do |view|
        view.source_files = 'SGBaseModule/Classes/SGView/**/*.{h,m}'
        view.dependency 'Masonry'
    end
    
    s.subspec 'SGViewController' do |viewController|
        viewController.source_files = 'SGBaseModule/Classes/SGViewController/**/*.{h,m}'
        viewController.dependency 'SGBaseModule/SGNavigationController'
        viewController.dependency 'SGBaseModule/SGView'
    end
    
end
