require 'csv'
require 'fileutils'
require 'digest/sha1'

class Checker
  def initialize(folder)
    @folder = folder
    @hashes = {}
  end

  attr_reader :folder

  def folder_items
    Dir.children(folder)
  end

  def path(dir, file_name)
    File.join(dir, file_name)
  end

  def file_content(dir, file_name)
    File.read(path(dir, file_name))
  end

  def encoded_content(dir, file_name)
    Digest::SHA1.hexdigest file_content(dir, file_name)
  end

  def array_of_hashes
    folder_items.each do |file|
      code = encoded_content(folder, file)
      if @hashes.key?(code)
        @hashes[code] << file
      else
        @hashes[code] = [file]
      end
    end
  end

  def repetitive_files
    @hashes.select { |_key, val| val.count > 1 }.values
  end

  def check
    array_of_hashes
    puts repetitive_files
  end
end
