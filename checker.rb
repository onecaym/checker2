require 'csv'
require 'fileutils'
require 'digest/sha1'

class Checker
  def initialize(folder)
    @folder = folder
    @hashes = {}
  end

  def folder_items
    Dir.children(@folder)
  end

  def file_content(dir, file_name)
    File.read("#{dir}#{file_name}")
  end

  def encoded_content(dir, file_name)
    Digest::SHA1.hexdigest file_content(dir, file_name)
  end

  def one_encrypted_file
    folder_items.map { |name| encoded_content(@folder, name) }.first
  end

  def joined_hashes(name)
    if @hashes.key?(one_encrypted_file)
      @hashes[one_encrypted_file] << [name]
    else
      @hashes[one_encrypted_file] = [[name]]
    end
  end

  def array_of_hashes
    folder_items.map do |name|
      each_encrypted_file = encoded_content(@folder, name)
      if one_encrypted_file == each_encrypted_file
        joined_hashes(name)
      else
        @hashes[each_encrypted_file] = [name]
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
