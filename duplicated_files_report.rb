require_relative 'file_content_duplication_finder'
class DuplicatedFilesReport
  def initialize(finder)
    @finder = finder
  end

  attr_reader :finder

  def show_folder_name_and_count
  	puts "Имя папки: #{finder.folder_name}"
  	puts "Общее количество файлов: #{finder.files_count}"
  end

  def prepare_files(array)
  	array.join(", ").to_s + " - Одинаковые по наполнению файлы"
  end

  def show_same_files
  	finder.duplicated_files.select {|array| puts prepare_files(array)}
  end

  def print_data
  	show_folder_name_and_count
  	show_same_files
  end
end
