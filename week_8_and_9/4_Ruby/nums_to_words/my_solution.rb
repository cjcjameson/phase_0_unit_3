# U3.W8-9: Numbers to English Words


# I worked on this challenge with Jake Persing and C.J. Jameson.

# 2. Pseudocode
# Take an integer and split it into its significant digits
# Based on its length, start translating portions appropriately
# hard coded items, then plan to refactor to make things more efficient


# 3. Initial Solution

# def in_words(number)
#     digit_array = number.to_s.split("")
#     digit_array.map!(&:to_i)
#     case digit_array.length
#     when 1
#         single_digit(digit_array[0])
#     when 2
#         double_digit(digit_array)
#     when 3
#         return "#{single_digit(digit_array[0])} hundred and #{double_digit(digit_array.slice(-2,2))}" 
#     end
# end

# def single_digit(number) #assume that we're taking this as an integer
#     case number
#     when 1
#         return "one"
#     when 2
#         return "two"
#     when 3
#         return "three"
#     when 4
#         return "four"
#     when 5
#         return "five"
#     when 6
#         return "six"
#     when 7
#         return "seven"
#     when 8
#         return "eight"
#     when 9 
#         return "nine"
#     else
#         return "zero"
#     end
# end

# def double_digit(digit_array) #takes an array
#     if digit_array[0] == 1
#         teens(digit_array[1])
#     elsif digit_array[1] == 0
#         tens_digit(digit_array[0])
#     else
#         tens_digit(digit_array[0]) + " " + single_digit(digit_array[1])
#     end
# end

# def tens_digit(number)
#     case number
#     when 2
#         return "twenty"
#     when 3
#         return "thirty"
#     when 4
#         return "forty"
#     when 5
#         return "fifty"
#     when 6
#         return "sixty"
#     when 7
#       return "seventy"
#     when 8
#       return "eighty"
#     when 9
#       return "ninety"
#     else
#         return ""
#     end
# end

# def teens(ones_digit) #pass the ones digit only
#     case ones_digit
#     when 1
#         return "eleven"
#     when 2
#         return "twelve"
#     when 3
#         return "thirteen"
#     when 4
#         return "fourteen"
#     when 5
#         return "fifteen"
#     when 6
#         return "sixteen"
#     when 7
#         return "seventeen"
#     when 8 
#         return "eighteen"
#     when 9
#         return "nineteen"
#     else
#         return "ten"
#     end
# end


# 4. Refactored Solution

$single_digit = {
  "1"=>"one",
  "2"=>"two",
  "3"=>"three",
  "4"=>"four",
  "5"=>"five",
  "6"=>"six",
  "7"=>"seven",
  "8"=>"eight",
  "9"=>"nine",
  "0"=>"zero"
}

$teens = {
  "1"=>"eleven",
  "2"=>"twelve",
  "3"=>"thirteen",
  "4"=>"fourteen",
  "5"=>"fifteen",
  "6"=>"sixteen",
  "7"=>"seventeen",
  "8"=>"eighteen",
  "9"=>"nineteen"
}

$tens_digit = {
  "2"=>"twenty",
  "3"=>"thirty",
  "4"=>"forty",
  "5"=>"fifty",
  "6"=>"sixty",
  "7"=>"seventy",
  "8"=>"eighty",
  "9"=>"ninety"
}

def in_words(number)
    digit_array = number.to_s.split("")
    #digit_array.map!(&:to_i)
    case digit_array.length
    when 1
        return $single_digit[digit_array[0]]
    when 2
        double_digit(digit_array)
    when 3
        return "#{$single_digit[digit_array[0]]} hundred #{double_digit(digit_array.slice(-2,2))}" 
    end
end


def double_digit(digit_array) #takes an array
    if digit_array[0] == '1'
        $teens[digit_array[1]]
    elsif digit_array[1] == '0'
        $tens_digit[digit_array[0]]
    else
        $tens_digit[digit_array[0]] + " " + $single_digit[digit_array[1]]
    end
end




# 1. DRIVER TESTS/ASSERT STATEMENTS GO BELOW THIS LINE

p in_words(4)=="four"         # => "four" 
p in_words(27)=="twenty seven"       # => "twenty seven"  
p in_words(92)=="ninety two"       # => "ninety two"  
p in_words(132)=="one hundred thirty two"



# 5. Reflection 

# good working together, I think we had a productive driver navigator role working together through the pseudocode and initial Solution
# then when we got to debugging it was good to break up and push together. May this be the most complicated Ruby function that
# I write without object-oriented style!!! it really bit us in the butt that we weren't explicitly defining our scopes, and we ended up
# creating global variables. Which probably makes a lot of sense here, I like our re-factor, but more than this and we should have been
# writing classes probably