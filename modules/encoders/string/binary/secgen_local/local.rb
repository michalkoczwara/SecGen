#!/usr/bin/ruby
require 'base64'
require_relative '../../../../../lib/objects/local_string_encoder.rb'
class BinaryEncoder < StringEncoder
  def initialize
    super
    self.module_name = 'Binary Encoder'
    self.strings_to_encode = []
  end

  def encode(str)
    str.unpack('B*')
  end
end

BinaryEncoder.new.run
