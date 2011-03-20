# encoding: UTF-8

require "nokogiri"    
require "open-uri"  
require "cgi"

$LOAD_PATH.unshift(File.expand_path("../youdao_translate", __FILE__))

require "version"
require "command"
require "youdao_word"
require "youdao_sentence"

