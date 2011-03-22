# encoding: UTF-8
require "optparse"
require "ostruct"

module YoudaoTranslate
  module Command

    def self.parse(args)
      options = OpenStruct.new

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: "

        opts.on_tail("-h", "--help", "Show this message") do
          STDOUT.puts(opts)
          exit
        end

        options.basic = true
        opts.on("-b", "--[no-]basic", "基本释义") do
          options.basic = false
        end

        options.phrase = false
        opts.on("-r", "--phrase", "词组短语") do
          options.phrase = true
        end

        options.synonym = false
        opts.on("-n", "--synonym", "近义词") do
          options.synonym = true
        end

        options.language = "eng"
        opts.on("-l", "--language OPT", ["eng", "fr", "chn"], "设置语言，默认翻译为英语") do |language|
          options.language = language
        end

        options.web = false
        opts.on("-w", "--web", "网络释义") do
          options.web = true
        end

        options.powertrans = false
        opts.on("-p", "--powertrans", "21世纪大英汉词典") do
          options.powertrans = true
        end

        options.eetrans = false
        opts.on("-e", "--eetrans", "英英释义") do
          options.eetrans = true
        end

        options.bilingual = false
        opts.on("-g", "--bilingual", "双语例句") do
          options.bilingual = true
        end

        options.original = false
        opts.on("-o", "--original", "原声例句") do
          options.original = true
        end

        options.authority = false
        opts.on("-a", "--authority", "权威例句") do
          options.authority = true
        end

        options.baike = false
        opts.on("-k", "--baike", "百科") do
          options.baike = true
        end

        options.sentence = false
        opts.on("-s", "--sentence", " ") do
          options.sentence = true
        end

        opts.on("-v", "--version", "版本号") do
          STDOUT.puts(VERSION)
          exit
        end

      end

      opts.parse!(args)
      options
    end
  end
end