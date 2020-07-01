require 'csv'
require 'fileutils'
require 'digest/sha1'

class Checker
  def initialize(folder)
    @folder = folder
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

  def array_of_hashes
    folder_items.map do |file_name|
      { file_name => encoded_content(@folder, file_name) }
    end
  end

  def repetitive_value
    uniq_value = array_of_hashes.map { |hash| hash.values.join }
    uniq_value.detect { |code| uniq_value.count(code) > 1 }
  end

  def check
    array_of_hashes.map do |hash|
      if repetitive_value == hash.values.first
        puts "#{hash.keys.first} - Использован несколько раз"
      else
        puts "#{hash.keys.first} - Повторений нет"
      end
    end
  end
end
