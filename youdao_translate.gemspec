# -*- encoding: utf-8 -*-

$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))
require "youdao_translate/version"

Gem::Specification.new do |s|
  s.name        = "youdao_translate"
  s.version     = YoudaoTranslate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Charles Shen"]
  s.email       = ["shenzhaoyan@gmail.com"]
  s.homepage    = "http://www.zyan.me"
  s.summary     = %q{Translate by Youdao.com}
  s.description = %q{Translate word and sentence by Youdao.com}

  s.add_development_dependency "nokogiri"

  s.rubyforge_project = "youdao_translate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end