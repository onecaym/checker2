require_relative 'file_content_duplication_finder'
class DuplicatedFilesReport
  def initialize(finder)
    @finder = finder
  end

  attr_reader :finder

  def show_duplicated_files
  	puts "Имя папки: #{finder.folder_name}"
  	puts"Общее количество файлов: #{finder.files_count}"
  	finder.duplicated_files.select {|array| puts array.join(", ").to_s + " - Одинаковые по наполнению файлы"}
  end
end
