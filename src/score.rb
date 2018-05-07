class Score



  def initialize(rolls)
    @rolls = rolls
  end

  def compute
    return 0 if @rolls.count == 0

    sum_values
  end

  private

  VALUES = {
    1 => 100,
    2 => 0,
    3 => 0,
    4 => 0,
    5 => 50,
    6 => 0
  }

  VALUES_x3 = {
    1 => 1000,
    2 => 200,
    3 => 300,
    4 => 400,
    5 => 500,
    6 => 600
  }
  def sum_values
    result = 0
    ordered_numbers = group_numbers
    ordered_numbers.each do |key, value|
      result += points_for_value(key, value)
    end

    result
  end

  def points_for_value(key, value)
    three_repetitions = value / 3
    one_repetitions = value % 3

    value_for_one(key, one_repetitions) + value_for_three_repetitions(key, three_repetitions)
  end

  def group_numbers
    ordered_numbers = Hash.new(0)
    @rolls.each do |roll|
      ordered_numbers[roll] += 1
    end

    ordered_numbers
  end

  def value_for_one(roll, repetitions)
    VALUES[roll] * repetitions
  end

  def value_for_three_repetitions(roll, repetitions)
    VALUES_x3[roll] * repetitions
  end
end
