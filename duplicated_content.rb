require_relative 'checker'
class Duplicated_content
	def initialize(folder)
		@folder = folder
	end

	attr_reader :folder

	def find
	    puts grouped_files.values.select { |files| files.count > 1 }
	end

	private

	def grouped_files
		check_duplicated_files = Checker.new(folder)
		check_duplicated_files.check
	end
end
