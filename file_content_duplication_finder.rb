require 'csv'
require 'fileutils'
require 'digest/sha1'

class FileContentDuplicationFinder
  def initialize(folder)
    @folder = folder
    @grouped_files = {}
    group_files
  end

  def duplicated_files
    grouped_files.values.select { |files| files.count > 1 }
  end

  private

  attr_reader :folder, :grouped_files

  def folder_items
    Dir.children(folder)
  end

  def path(file_name)
    File.join(folder, file_name)
  end

  def file_content(file_name)
    File.read(path(file_name))
  end

  def encoded_content(file_name)
    Digest::SHA1.hexdigest file_content(file_name)
  end

  def group_files
    folder_items.each do |file|
      code = encoded_content(file)
      if grouped_files.key?(code)
        grouped_files[code] << file
      else
        grouped_files[code] = [file]
      end
    end
  end
end
