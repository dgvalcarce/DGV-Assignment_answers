require_relative 'tsvreader' 
require_relative 'tsvwriter'
require_relative 'seed_processor'
require_relative 'seed'
require_relative 'gene'
require_relative 'crossdata'
require_relative 'linked_genes'

#Check for correct usage
if ARGV.length != 4
    puts "ERROR: Expected different arguments.\nCorrect usage: ruby process_database.rb gene_info_file.tsv seed_stock_file.tsv cross_data_file.tsv new_seed_stock_file.tsv"
    exit (1)
end

#Check if the given files actually exist
unless File.exist?(ARGV[0])
    puts "Gene info file '#{ARGV[0]}' not found."
    exit(1)
end

unless File.exist?(ARGV[1])
    puts "Seed stock file '#{ARGV[1]}' not found."
    exit(1)
end

unless File.exist?(ARGV[2])
    puts "Cross data file '#{ARGV[2]}' not found."
    exit(1)
end


#Save the files into objects
gene_info = TsvReader.new(ARGV[0])
seed_stock = TsvReader.new(ARGV[1])
cross_data = TsvReader.new(ARGV[2])

#Process each of the file objects to turn each line into an object itself
seeds = []
seed_stock.data.each do |row|
    seeds << Seed.new(row)
end

genes=[]
gene_info.data.each do |row|
    genes << Gene.new(row, seeds)
end

crossdatas=[]
cross_data.data.each do |row|
    crossdatas << CrossData.new(row)
end


#Define a variable for the amount of planted seeds
planted_grams = 7
#Process each of the seeds objects, by substracting the previously especified amount to it. Print any warning messages if needed.
processed_seeds = SeedProcessor.new(seeds, planted_grams)
#Save new processed seed objects as a new file
TsvWriter.new(seed_stock.header, processed_seeds.seeds, ARGV[3])


#For the crossdata pairs of genes which have chisquare values of over 7.81 the p-value is below p=0.05, therefore those gene pairs are linked. 
#We will save these pairs as a new object.
linkedgenes = []
crossdatas.each do |crossdata|
    if crossdata.chisquare > 7.81
        linkedgenes << LinkedGenes.new(crossdata, seeds, genes)
    end
end



#Print the final report, writing a line for every linkage found between two genes
puts "\n\nFinal Report:"
linkedgenes.each do |linkedgene|
    puts "\n#{linkedgene.genenames[0]} is linked to #{linkedgene.genenames[1]}\n#{linkedgene.genenames[1]} is linked to #{linkedgene.genenames[0]}"
end