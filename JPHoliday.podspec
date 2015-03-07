Pod::Spec.new do |s|
  s.name = "JPHoliday"
  s.version = "0.0.1"
  s.summary = "Holidays in Japan."
  s.description = <<-DESC
JPHoliday is Swift library to deal with holidays in Japan.
  DESC
  s.homepage = "https://github.com/mako2x/JPHoliday"
  s.license = "MIT"
  s.author = { "mako2x" => "arekara3nen@gmail.com" }
  s.source = { :git => "https://github.com/mako2x/JPHoliday.git", :tag => s.version }
  s.ios.deployment_target = "8.0"
  s.requires_arc = true
  s.source_files = "JPHoliday/*.swift"
end
