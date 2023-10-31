#To handle tsv files
require 'csv'

#Define a class to read tsv files, separates them into header and data
class TsvReader 
    def initialize(file)
        content = CSV.read(file, col_sep: "\t")
        @header = content[0]
        @data = content[1..content.length]
    end
    attr_accessor :data, :header
end