class Sequence
  def task
    puts 'enter the length of the sequence'
    # count of the blocks
    blocks = gets.to_i 

    # the first number of the sequence
    digit = 1 
    # number of symbol repetitions
    count = 1 
    # answer
    result = '' 

    if blocks < 1
      puts 'the length of the sequence must be a positive number'
    else
      puts "the length of the sequence: #{blocks}"
      puts digit
      while blocks > 1
        array = []
        digit.to_s.each_char  { |c| array.push(c) }
        first = array[0]
        array.delete_at(0)

        if array.empty?
          result = count.to_s + digit.to_s
          puts result
          digit = result
        else
          count = 1

          array.each do |char|
            if first == char
              count += 1
            else
              result += count.to_s + first
              first = char
              count = 1
            end
          end
          result += count.to_s + array[array.length()-1]
          puts result
        end

        digit = result
        blocks -= 1
        result = ''
      end
    end
  end
end

sequence = Sequence.new
sequence.task
