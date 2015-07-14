# A Ruby Complimentary Component Value Matcher
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

class Match
    
    attr_reader :result

    def report
        percent = 200 * Float(@result.count) / Float(@total)
        puts "%d pairs found from %d total parts (%.0f%% matched)" % [@result.count,@total,percent]
        @result.each { |v| puts "   [ %.2f | %.2f ]   (%.2f)" % [v[0],v[1],v[2]] }
    end

    def match(threshold)
        @result, matched = [], true
        while @a.count>0 && @b.count>0 && matched==true do
            d, matched = [], false
            @a.each.with_index do |va,ia|
                @b.each.with_index { |vb,ib| d << [(va-vb).abs,va,vb,ia,ib] }
            end      
            l = d.sort! { |x,y| x[0] <=> y[0] } [0]
            if l[0] <= threshold
                matched = true
                @result << [l[1],l[2],l[0]]
                @a.delete_at(l[3])
                @b.delete_at(l[4])
            end
        end
        self
    end

    def initialize(a,b)
        @a, @b, @total = a, b, a.count+b.count
    end

end
