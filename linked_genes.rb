#Define class linkedgenes, pairs of genes that are linked according to their chisquare value. To facilitate things you can access them by the seed ID, by the gene ID or by the gene name.
#Produces a message for each pair of linked genes.
class LinkedGenes
    def initialize(crossdata, seeds, genes)
        @seednames = [crossdata.parent1,crossdata.parent2]
        @geneids = []
        @genenames = []
        @chisquare = crossdata.chisquare
        
        genes.each do |gene|
            if gene.seed_stock == @seednames[0]
                @genenames[0] = gene.name
                @geneids[0] = gene.id
            elsif gene.seed_stock == @seednames[1]
                @genenames[1] = gene.name
                @geneids[1] = gene.id
            end
        end

        puts "Recording: #{@genenames[0]} is genetically linked to #{@genenames[1]} with chisquare score #{@chisquare}"
    end

    attr_accessor :seeds, :geneids, :genenames, :chisquare
end   