require_relative 'file_content_duplication_finder'
class DuplicatedFilesReport
  def initialize(finder)
    @finder = finder
  end

  attr_reader :finder

  def show_duplicated_files
    puts finder.duplicated_files
  end
end
