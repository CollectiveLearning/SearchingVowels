require "thread"

queue = Queue.new

Thread.new do
  10.times do |i|
    sleep 1 # simulate expense
    queue << i
    puts "#{i} produced"
  end
end

consumer = Thread.new do
  sleep 3
  5.times do
    value = queue.pop
    sleep 2 # simulate expense
    puts "consumed #{value}"
  end
end

consumer.join
