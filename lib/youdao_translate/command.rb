require "optparse"
require "ostruct"

module YoudaoTranslate
  module Command

    def self.parse(args)
      options = OpenStruct.new

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: example.rb [options]"

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        options.basic = false
        opts.on("-b", "--basic", "Get basic") do
          options.basic = true
        end

        options.language = "eng"
        opts.on("-l", "--language OPT", ["eng", "fr", "chn"], "Set language,default english") do |language|
          options.language = language
        end

        options.original = false
        opts.on("-o", "--original", " ") do
          options.original = true
        end

        options.baike = false
        opts.on("-k", "--baike", " ") do
          options.baike = true
        end
      end

      opts.parse!(args)
      options
    end

  end
end