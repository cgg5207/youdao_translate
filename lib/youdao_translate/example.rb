require 'optparse'
require 'ostruct'

class OptparseExample

  def self.parse(args)
    options = OpenStruct.new

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"

      options.basic = false
      opts.on("-b", "--basic", "Get basic") do
        options.basic = true
      end
    end

    opts.parse!(args)
    options
  end
end

options = OptparseExample.parse(ARGV)
puts options.basic