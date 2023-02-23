class Octal

  def initialize(n)
    @number = n
  end

  def to_decimal
    decimal_value = 0;
    return 0 unless valid_octal?
    @number.chars.reverse.each_with_index do |n, i|
      decimal_value += (n.to_i%8) * 8**i.to_i
    end
    decimal_value
  end

  def valid_octal?
    @number.chars.all? do |n|
      ('0'..'7').include?(n)
    end
  end


end

#p Octal.new('9').to_decimal