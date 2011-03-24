# encoding: UTF-8
require "nokogiri"
require "open-uri"
require "cgi"

$LOAD_PATH.unshift(File.expand_path("../youdao_translate", __FILE__))

require "version"
require "command"
require "youdao_word"
require "youdao_sentence"

def parse_ostruct_to_hash(ostruct)
  # ostruct.is_a?(OpenStruct)
  keys = ostruct.methods(false).reject { |method| method.to_s.end_with?("=") }
  keys.inject({ }) do |hash, key|
    hash[key.to_s] = ostruct.send(key)
    hash
  end
end