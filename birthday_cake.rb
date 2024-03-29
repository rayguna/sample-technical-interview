=begin
birthday_cake.rb

It's your birthday! Yay! 🎂

Can you debug this BirthdayCake class in time to sing happy birthday? 🎶

Tip: Resolve the error messages before trying to make it work

Expected output:
Happy 10th Birthday!
Birthday cake with 10 blown out candles
Lighting candles...
Birthday cake with 10 lit candles
Singing happy birthday...
🎶Happy birthday to you, happy birthday to you🎶
Blowing out candles...
Birthday cake with 10 blown out candles

=end

require "active_support/all"

class BirthdayCake
  attr_accessor :age, :lit

  def initialize(age, lit)
    self.age = age
    self.lit = false
  end

  def candles_status
    if self.lit == true
      return "lit"
    else
      return "blown out"
    end
  end

  def greet
    "Happy #{self.age.ordinalize} Birthday!"  #2. Birdday!
  end

  def sing
    "🎶Happy birthday to you, happy birthday to you🎶"
  end

  def to_s
    "Birthday cake with #{self.age} #{candles_status} candles"
  end

  def BirthdayCake.celebrate(age)

    #parse the expected output for testing purposes.
    expected_output = """Happy 10th Birthday!
    Birthday cake with 10 blown out candles
    Lighting candles...
    Birthday cake with 10 lit candles
    Singing happy birthday...
    🎶Happy birthday to you, happy birthday to you🎶
    Blowing out candles...
    Birthday cake with 10 blown out candles"""

    arr_expected_output = expected_output.split("\n").map(&:strip) #parse each line and remove spaces
    #p arr_expected_output #check

  
    birthday_cake = BirthdayCake.new(age, false) #1: Birthdaycake.new(age)

    puts birthday_cake.greet
    raise "Doesn't match" unless birthday_cake.greet.to_s == arr_expected_output[0]

    puts birthday_cake.to_s
    raise "Doesn't match" unless birthday_cake.to_s == arr_expected_output[1]

    puts "Lighting candles..."
    raise "Doesn't match" unless "Lighting candles..." == arr_expected_output[2]

    #light candles:
    birthday_cake.lit = true #2: .light_candles
    
    puts birthday_cake.to_s
    raise "Doesn't match" unless birthday_cake.to_s == arr_expected_output[3]

    puts "Singing happy birthday..."
    raise "Doesn't match" unless "Singing happy birthday..." == arr_expected_output[4]

    puts birthday_cake.sing #3: .sign
    raise "Doesn't match" unless birthday_cake.sing == arr_expected_output[5]

    puts "Blowing out candles..."
    raise "Doesn't match" unless "Blowing out candles..." == arr_expected_output[6]  

    birthday_cake.lit = false  #4: .blow_out_candles

    puts birthday_cake.to_s
    raise "Doesn't match" unless birthday_cake.to_s == arr_expected_output[7]  

    #birthday_cake #not needed #5: this last line is not needed.
    
  end
end

"""
1. The first error has to do with object instantiation, which is located within the BirthdayCake.celebrate method.
  - fix a typo.
2. The second error is due to the missing method called light_candles; instead, the lit attribute must be set to true. Also, the typo should be corrected.
3. The third error is due to the missing method called sign; instead, call the sing method.
4. The fourth error is due to the missing method called blow_out_candles; instead, the lit attribute must be set to false.
5. The last line is not needed. It is redundant as it doesn't produce any outputs.
"""
BirthdayCake.celebrate(10) #call class, along with the class' method.
