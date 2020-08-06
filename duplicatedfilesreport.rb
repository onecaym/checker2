require_relative 'filecontentduplicationfinder'
class DuplicatedFilesReport
  def initialize(filecontentduplicationfinder)
    @filecontentduplicationfinder = filecontentduplicationfinder
  end

  attr_reader :filecontentduplicationfinder

  def show_duplicated_files
    puts filecontentduplicationfinder.duplicated_files
  end
end
