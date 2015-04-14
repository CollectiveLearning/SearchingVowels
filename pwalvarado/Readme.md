### Problem

How many vowels are in a text? This is our problem, but the main goal is
learn how to use threads in ruby, so, we need to design a solution to find
the number of words in a very long text in two ways

1. Sequential
2. Threads


Plase use the file "text.txt" for your solution, copy it in your solution
folder.


### Output

You must write the vowels count and for performance porpouse, please add
the execution time.

Run with:

    ruby counting_vowels.rb

Output:

    These are different outputs for differents slice_sizes (1000, 2000, 4000):


    slice_size 1000 ± : ruby counting_vowels.rb
    Sequential counting
     {"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
    run in 8.451438418 secs

    Parallel counting
     {"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
    run in 9.275045906 secs

    #----------------------------------------------------------------------------------------------------


    slice_size 2000 ± : ruby counting_vowels.rb
    Sequential counting
     {"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
    run in 8.392084578 secs

    Parallel
    counting {"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
    run in 9.039424403 secs

    #----------------------------------------------------------------------------------------------------

    slice_size 4000  ± : ruby counting_vowels.rb

    Sequential counting
     {"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
    run in 7.97836736 secs

    Parallel counting
     {"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
    run in 8.668010215 secs
