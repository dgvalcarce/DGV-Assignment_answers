#Define a class to process the seed inventory in a given data by a given number of planted seeds.
#Produces a warning message if you run out of stock
class SeedProcessor
    def initialize(seeds, planted_seeds)
        seeds.each do |seed|
            seed.last_planted = Time.now.strftime("%d/%m/%Y")
            if seed.remaining > planted_seeds
                seed.remaining = seed.remaining - planted_seeds
            elsif seed.remaining == planted_seeds
                puts "WARNING: we have run out of Seed Stock #{seed.seed_id}. But all #{seed.remaining} grams were planted."
                seed.remaining = 0
            else
                puts "WARNING: we have run out of Seed Stock #{seed.seed_id}. Only #{seed.remaining} grams were planted."
                seed.remaining = 0
            end
        end
        @seeds = seeds
    end

    attr_accessor :seeds
end