require 'nmax/version'

module Nmax
  # Find all decimals in stdin
  # Slice result array to N
  #
  # @params stdin - STDIN
  # @params n [INTEGER] - size of result array
  #
  # @return [Array] - array of found numbers
  def find_decimals_in_stdin(stdin, n)
    start_t = Time.now
    puts 'Processing. Please wait...'
    @numbers = []
    stdin.each_line do |line|
      line_to_digits(line)
    end
    @numbers.uniq!.sort!.reverse!
    end_t = Time.now
    puts 'DONE!'
    puts "Work time: #{end_t - start_t}"
    @numbers.first(n)
  end

  # Find numbers in line and add it to @numbers
  #
  # @param line [String] - line for searching
  def line_to_digits(line)
    line.scan(/\d+/) do |digit|
      @numbers << digit.to_i
    end
  end
end
