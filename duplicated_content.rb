require_relative 'checker'
class DuplicatedContent
  def initialize(checker)
    @checker = checker
  end

  attr_reader :checker

  def show_duplicated_files
    puts checker.duplicated_files
  end
end
