# frozen_string_literal: true

# Input/Output related methods
module InputOutput
  def get_valid_value(prompt:, valid_values:, invalid_msg:, up_case: false)
    puts prompt
    loop do
      value = up_case ? gets.chomp.upcase : gets.chomp
      return value if valid_values.include?(value)

      puts invalid_msg
    end
  end

  def print_banner(text:)
    puts
    puts '----------------------'
    puts text.upcase
    puts '----------------------'
    puts
  end
end
