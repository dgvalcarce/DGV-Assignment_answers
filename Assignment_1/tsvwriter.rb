#To handle tsv files
require 'csv'

#Define a class to write tsv files
class TsvWriter
    def initialize(header, data, file)
        CSV.open(file, 'w', col_sep: "\t") do |tsv|
            tsv << header
            data.each do |instance|
                tsv << [instance.seed_id,instance.mutant_gene_id,instance.last_planted,instance.storage,instance.remaining]
            end
        end
    end
end