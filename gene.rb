#Define class gene, relate it to the seed stock containing its mutation
class Gene
    def initialize(data, seeds)
        @id = data[0]
        @name = data[1]
        @phenotype = data[2]
    
        seeds.each do |seed|
            if seed.mutant_gene_id == @id
                @seed_stock = seed.seed_id
            end
        end
    end

    attr_accessor :id, :name, :phenotype, :seed_stock
end