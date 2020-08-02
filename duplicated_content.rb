require_relative 'checker'
class Duplicated_content
  def initialize(folder)
    @folder = folder
  end

  attr_reader :folder

  def show_duplicated_files
    puts duplicated_files
  end

  private

  def duplicated_files
    grouped_files.values.select { |files| files.count > 1 }
  end

  def grouped_files
    folder.check
  end
end
