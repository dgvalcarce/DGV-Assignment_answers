#Define class cross data, calculate chisquare for each pair of genes
class CrossData
    def initialize(data)
        @parent1 = data[0]
        @parent2 = data[1]
        @wt = data[2].to_f
        @p1 = data[3].to_f
        @p2 = data[4].to_f
        @p1p2 = data[5].to_f

        total = @wt + @p1 + @p2 + @p1p2
        @chisquare = ((wt - (total * 9)/16)**2)/((total * 9)/16) + ((p1 - (total * 3)/16)**2)/((total * 3)/16) + ((p2 - (total * 3)/16)**2)/((total * 3)/16) + ((p1p2 - (total)/16)**2)/((total)/16)
    end
    attr_accessor :parent1, :parent2, :wt, :p1, :p2, :p1p2, :chisquare
end