class MathUtils

    def self.add(first, second)
      result = first.to_i + second.to_i
      if second.to_s.count("+") > 0
        array = second.to_s.split("+")
        array.each do |element|
          result = result + element.to_i
        end
        result = result - second.to_i
      end
      result
    end

    def self.add_array_elements(array)
      sum = 0
      array.each do |element|
        sum = sum + element.to_i
      end
      sum
    end

    def self.subtract_array_elements(array)
      initial_value = array[0].to_i == 0 ? array[1] : array[0]
      result = initial_value
      array.each do |element|
        result = result.to_i - element.to_i
      end
      result = result + initial_value.to_i
    end

    def self.multiply_array_elements(array)
      result = 1
      array.each do |element|
        result = result * element.to_i
      end
      result
    end

    def self.divide_array_elements(array)
      result = array[0].to_f
      array.each do |element|
        result = result / element.to_f
      end
      result = result * array[0].to_f
      result
    end

    def self.subtract(first, second)
      result = first.to_i - second.to_i
      if second.to_s.count("-") > 0
        array = second.to_s.split("-")
        array.each do |element|
          result = result - element.to_i
        end
        result = result + second.to_i
      end
      result
    end

    def self.multiply(first, second)
      result = first.to_i * second.to_i
      if second.to_s.count("*") > 0
        array = second.to_s.split("*")
        array.each do |element|
          result = result * element.to_i
        end
        result = result / second.to_i
      end
      result
    end

    def self.divide(first, second)
      result = first.to_f / second.to_f
      contains_slashes = second.to_s.count("\\") > 0 || second.to_s.count("//") > 0
      if contains_slashes
        if second.to_s.count("\\") > 0
        array = second.to_s.split("\\")
        else
          array = second.to_s.split("//")
        end
        array.each do |element|
          result = result / element.to_f
        end
        result = result * second.to_f
      end
      result
      end
end