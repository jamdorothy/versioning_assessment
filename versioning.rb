class Versioning
    def self.increment_version_number(current_version)
        # splitting string into 2 parts because only the first number can be >9
        current_version = current_version.split(".", 2)
        first_number = current_version[0]
        remaining_numbers = current_version[1].split('.')
    
        if remaining_numbers.all?('9')
            # turn separated first number into an integer to allow addition
            first_number = first_number.to_i
            first_number += 1
            # turn incremented first number back to string
            first_number = first_number.to_s
            # replace all 9s in the remaining numbers with 0
            result = remaining_numbers.map { |n| n.gsub!('9', '0') }.join('.')
        else
            result = self.increment_remaining_numbers_array(remaining_numbers).join('.')
        end
        # prepend first number with remaining numbers
        result.prepend(first_number + '.')
    end

    def self.increment_remaining_numbers_array(numbers)
        next_num_should_be_incrememted = true
        # reversing allows us to interact with the final number first & perform additon as normal
        numbers = numbers.reverse

        numbers = numbers.map do |num|
            num = num.to_i

            if next_num_should_be_incrememted
                num += 1

                # if number is 10 after incrementation, return it as 0 and allow incrementing to happen next iteration
                if num == 10
                    '0'
                else
                    # number after incrementation is not 10, so next number should not increment
                    next_num_should_be_incrememted = false
                    num.to_s
                end
            else
                num.to_s
            end
        end

        # reverse back to original order
        numbers.reverse
    end
end
