class Input
	def initialize(grouped_files)
		@grouped_files = grouped_files
	end

	attr_reader :grouped_files

	def duplicated_files
	    puts grouped_files.values.select { |files| files.count > 1 }
	end
end