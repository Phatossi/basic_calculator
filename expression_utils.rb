class ExpressionUtils

  def self.are_different_operators_present(input)
    if input.include? "+"
      if input.count("-*\\//") > 0
        true
      end
    elsif input.include? "-"
      if input.count("+*\\//") > 0
        true
      end
    elsif input.include? "*"
      if input.count("+-//") > 0
        true
      end
    elsif input.include? "//"
      if input.count("+-*//") > 0
        true
      end
    else
      false
    end
  end

  def self.choose_operation(operation)
    operator = ""
    case operation
      when "+"
        operator = "plus"
        operator
      when "-"
        operator = "minus"
        operator
      when "*"
        operator = "multiplied by"
        operator
      when "\\"
        operator = "divided by"
        operator
    end
  end


  def self.extract_components(expression)
    operator = identify_operator(expression)
    components = expression.split(operator)
    if operator == "-" && expression.to_s.index(operator) == 0
        components[1] = components[1].to_i * (-1)
    end
    components
  end

  def self.identify_operator(expression)
    expression = expression.to_s
    if expression.index("+")
      "+"
    elsif expression.index("-")
      "-"
    elsif expression.index("*")
      "*"
    elsif expression.index("\\") || expression.index("//")
      "\\"
    else
      "Invalid operator"
    end
  end

  def self.operator_name(expression)
    if expression.index("+")
      "plus"
    elsif expression.index("-")
      "minus"
    elsif expression.index("*")
      "times"
    elsif expression.index("\\") || expression.index("//")
      "divided by"
    else
      "Invalid operator"
    end
  end

  def self.get_terms(input)
    extract_components(input)
  end

  def self.is_valid_expression?(expression)
    is_number = is_number? (expression)
    if !is_number
      false
    end
    if (!(is_number? (expression))) || (identify_operator(expression) == "Invalid operator") || (expression.to_s.split(identify_operator(expression)).size < 2)
      false
    else
      true
    end
  end

  def self.is_number?(expression)
    if expression != "0" && Integer(expression.to_i) == 0
      false
    else
      true
    end
  end

end