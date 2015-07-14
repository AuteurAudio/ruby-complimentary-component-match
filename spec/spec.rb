# A Ruby Complimentary Component Value Matcher
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

require 'test/unit'
require '../src/match.rb'

class TestMatch < Test::Unit::TestCase

    def test_no_match
        a = [1.1,2,3,3,3.5]
        b = [1.11,2.4,3.05,3.4]
        x = Match.new(a,b).match(0.0001).result
        assert_equal([],x)
    end

    def test_some_match
        a = [1.1,2,3,3,3.5]
        b = [1.11,2.4,3.05,3.4]
        x = Match.new(a,b).match(0.1).result
        assert_equal([[1.1, 1.11, 0.010000000000000009], [3, 3.05, 0.04999999999999982]],x)
    end

    def test_all_match
        a = [1.1,2,3,3,3.5]
        b = [1.11,2.4,3.05,3.4]
        x = Match.new(a,b).match(100).result
        assert_equal([[1.1, 1.11, 0.010000000000000009], [3, 3.05, 0.04999999999999982], [3.5, 3.4, 0.10000000000000009], [2, 2.4, 0.3999999999999999]],x)
    end

end
