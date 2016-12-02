require_relative 'math_utils.rb'
require_relative 'expression_utils.rb'


class InputOutput

  def process_functions
    launch
    get_input
    close_application
  end

  def initialize(file_name = "history.txt")
    file = File.open(file_name, 'w+')
    file.close
  end

  def launch
    print "\n\n<< Welcome to a command line directed calculator >> \n\n"
    print "We wish you happy calculations :)!\n"
  end

  def get_input
    display_action_header
    input = gets.chomp.strip
    #TODO Use enumerations
    while input != "quit"
      while ExpressionUtils.are_different_operators_present(input)
        puts "Multiple operators are not currently supported. Please write another expression."
        input = gets.chomp.strip
      end
      while input != "quit" && !ExpressionUtils.is_valid_expression?(input)
        puts "Invalid expression. Please write another one"
        input = gets.chomp.strip
      end
    operator = ExpressionUtils.identify_operator(input)
    terms = ExpressionUtils.get_terms(input)
      if operator == "-" && input.index(operator) == 0
        terms[0] = terms[0].to_i * (-1)
      end
    result  = perform_action_with_arrays(terms, operator)
    display_output(input, result, operator)
    input = gets.chomp.strip
    end
  end


  def display_output(input, result, operator)
    result = result.to_s.gsub(operator, " " + ExpressionUtils.operator_name(operator) + " ")
    output = input.to_s.gsub(operator, " " + ExpressionUtils.operator_name(operator) + " ") + " equals " + result.to_s
    save_result_to_file(output)
    puts output
    puts "Great job! Now write another expression that you want to calculate:\n"
  end

  def perform_action_with_arrays(components, operator)
    case operator
      when "+"
         MathUtils.add_array_elements(components)
      when "-"
         MathUtils.subtract_array_elements(components)
      when "*"
        MathUtils.multiply_array_elements(components)
      when "//"
        MathUtils.divide_array_elements(components)
    end
  end


  def display_action_header
    print "Please type an action that you want to perform: "
    puts "Examples can be: 3+31, 4*312, 89/21, 19-391"
    puts "If you want to quit from the application, please write \"quit\" (without quotes)\n"
  end

  def perform_action(first_operand, action, second_operand)
    result = 0
    case action
      when "+"
        result = MathUtils.add(first_operand, second_operand)
      when "-"
        result = MathUtils.subtract(first_operand, second_operand)
      when "*"
        result = MathUtils.multiply(first_operand, second_operand)
      when "\\"
        result = MathUtils.divide(first_operand, second_operand)
    end
    result
  end

  def save_result_to_file(input)
    File.open("history.txt", "a") do |file|
      file.puts("Time: " + Time.now.strftime("%d/%m/%Y %H:%M") + " ---\tExpression: " + input.to_s + "\t")
    end
  end

  def close_application
      print "\n\nThanks for using our calculator\n"
      print "Have an awesome day!\n"
  end

end