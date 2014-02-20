class SmallestMultiple
require 'pp'

  def find_primes(number)
    prime_factors = []
    (2..number).each do |num|
      while number % num == 0
        prime_factors << num
        number /= num
      end
      break if number == 1
    end
    prime_factors
  end

  def pass_in_a_group_of_nums_to_find_the_prime_factors(upto)
    primes_for_a_group_of_nums = []
    for every_element in (2..upto)
      primes_for_a_group_of_nums << find_primes(every_element)
    end
    primes_for_a_group_of_nums
  end

  def count_identical_elements_in_array_and_create_hash(primes_for_a_group_of_nums)
      array_of_hashes = []
      primes_for_a_group_of_nums.each do |each_prime_factor_set|
        a = each_prime_factor_set
        b = Hash.new(0)
        a.each { |v| b[v] += 1 }
        b
        array_of_hashes << b
    end
       array_of_hashes
  end

  #ASK BEN WHY THE EACH STATEMENT DID NOT WORK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # def compare_the_hashes(array_of_hashes)
  #   array_of_hashes.each do
  #     array_of_hashes[0].merge!(array_of_hashes[1]) { |key, oldval, newval| [newval, oldval].max }
  #     array_of_hashes.delete_at(1)
  #   end
  #   array_of_hashes
  # end

  def compare_the_hashes(array_of_hashes)
    while array_of_hashes.count != 1 do
      array_of_hashes[0].merge!(array_of_hashes[1]) { |key, oldval, newval| [newval, oldval].max }
      array_of_hashes.delete_at(1)
    end
    array_of_hashes
  end

  def does_calculation(array_of_hashes)
    evaluation = []

    array_of_hashes[0].each do |key, value|
      evaluation << key**value
    end

    # final_evaluation = 1
    # evaluation.each do |each_element|
    #   final_evaluation *= each_element
    # end
    # final_evaluation

    return evaluation.inject(1, :*)

  end

  def project_euler_solution(upto)
    step_one = pass_in_a_group_of_nums_to_find_the_prime_factors(upto)
    step_two = count_identical_elements_in_array_and_create_hash(step_one)
    step_three = compare_the_hashes(step_two)
    does_calculation(step_three)
  end

end
