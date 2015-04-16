### Problem

How many vowels are in a text? This is our problem, but the main goal is
learn how to use threads in ruby, so, we need to design a solution to find
the number of words in a very long text in two ways

1. Sequential
2. Threads

### How to run?

    $ ruby lib/count_vowels.rb

    => Sequential Search
    {"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
    run in 9.580262 seconds
    Parallel Search
    {"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
    run in 6.660218 seconds
