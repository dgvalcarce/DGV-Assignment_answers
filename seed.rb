#Define class seed
class Seed
    def initialize(data)
        @seed_id = data[0]
        @mutant_gene_id = data[1]
        @last_planted = data[2]
        @storage = data[3]
        @remaining = data[4].to_f
    end

    attr_accessor :seed_id, :mutant_gene_id, :last_planted, :storage, :remaining
end