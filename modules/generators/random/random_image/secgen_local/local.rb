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
    # Get all Filenames in directory
    image_filenames = Dir["#{IMAGES_DIR}/*"]
    # Select one
    selected_filename = image_filenames.sample

    # Copy the file to a temporary location and operate on the temp file.
    temp_file_path = File.expand_path('../../files/tmp.jpg', __FILE__)
    FileUtils.cp(selected_filename, temp_file_path)

    # Open temp file handle + append our string
    File.open(temp_file_path, 'a') { |f| f.write(self.string_to_insert) }

    contents = File.binread(temp_file_path)
    encoded = Base64.encode64(contents)
    # contents << File.readlines(temp_file_path)
    self.outputs << encoded
  end

  def encoding_print_string
    'Random image generator'
  end

end

ImageGenerator.new.run