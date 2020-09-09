require_relative 'file_content_duplication_finder'
class DuplicatedFilesReport
  def initialize(finder)
    @finder = finder
  end

  attr_reader :finder

  def show_folder_name
  	puts "Имя папки: #{finder.folder_name}"
  end

  def show_files_count
  	puts "Общее количество файлов: #{finder.files_count}"
  end

  def show_same_files
  	finder.duplicated_files.select {|array| puts array.join(", ").to_s + " - Одинаковые по наполнению файлы"}
  end

  def provide_data
  	show_folder_name
  	show_files_count
  	show_same_files
  end
end
