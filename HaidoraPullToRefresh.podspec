Pod::Spec.new do |s|
  s.name         = "HaidoraPullToRefresh"
  s.version      = "1.0"
  s.summary      = "HaidoraPullToRefresh."

  s.description  = <<-DESC
                  A pull to refresh.(deprecated)
                   DESC

  s.homepage     = "https://github.com/Haidora/HaidoraPullToRefresh"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  
  s.author             = { "mrdaios" => "mrdaios@gmail.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/Haidora/HaidoraPullToRefresh.git", :tag => s.version.to_s }

  s.source_files  = 'Source/*.{h,m}'
  s.resources = "Resource/HaidoraPullToRefresh.bundle"

  s.requires_arc = true
  s.deprecated = true

end
