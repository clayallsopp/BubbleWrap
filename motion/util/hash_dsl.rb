# Stupid hack because the RubyMotion dependency detection has a bug.
module Kernel.const_get("BubbleWrap")::Util

=begin
  Class which makes it possible to seamlessly create a DSL
  and use a Hash constructor
  EXAMPLE:

  module BW
    class SomeWrapper

      # SomeWrapper.new do |wrapper|
      #  wrapper.option "hello"
      #  wrapper.another option: "with_a", hash: true
      # end
      def self.new(params = nil, &callback)
        if !params
          dsl = HashDSL.new
          callback.call(dsl)
          params = dsl.hash
        end

        # use params to do stuff
      end
    end
  end
=end
  class HashDSL
    attr_accessor :hash

    def initialize(delegate = nil)
      @hash = {}
    end

    def method_missing(method, *args, &block)
      if !args.empty?
        if args.length == 1
          @hash[method] = args[0]
        else
          @hash[method] = args
        end
      end

      if block
        @hash[method] = block
      end
    end
  end
end

