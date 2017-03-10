#!/usr/bin/ruby
require 'fileutils'
require 'base64'
require_relative '../../../../../lib/objects/local_string_encoder.rb'
class ImageGenerator < StringEncoder
  attr_accessor :string_to_insert

  def initialize
    super
    self.module_name = 'Random Image Generator'
    self.string_to_insert = 'test_string'
  end

  def encode_all
    image_filenames = Dir["#{IMAGES_DIR}/*"]
    selected_filename = image_filenames.sample

    file_contents = File.binread(selected_filename)
    self.outputs << Base64.strict_encode64(file_contents)
  end

  def encoding_print_string
    'Random image generator'
  end
end

ImageGenerator.new.run