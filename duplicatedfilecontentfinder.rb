require_relative 'filecontentduplicationanalyzer'
class DuplicatedFileContentFinder
  def initialize(filecontentduplicationanalyzer)
    @filecontentduplicationanalyzer = filecontentduplicationanalyzer
  end

  attr_reader :filecontentduplicationanalyzer

  def show_duplicated_files
    puts filecontentduplicationanalyzer.duplicated_files
  end
end
