### Problem

How many vowels are in a text? This is our problem, but the main goal is
learn how to use threads in ruby, so, we need to design a solution to find
the number of words in a very long text in two ways

1. Sequential
2. Threads

Plase use the file "text.txt" for your solution, copy it in your solution
folder.

### Running

To run the program just type this command in terminal:

`ruby sequential_search.rb` for sequential search
`ruby parallel_search.rb` for parallel search

### Output

You must write the vowels count and for performance porpouse, please add
the execution time.

### Sequential

`$ ruby sequential_search.rb`

## Output
`{"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
Run in 12.943612394 seconds.`

### Threads

`$ ruby parallel_search.rb`

## Output
`{"a"=>4049408, "e"=>6050373, "i"=>3550018, "o"=>4236236, "u"=>1487946}
Run in 9.724001381 seconds.`