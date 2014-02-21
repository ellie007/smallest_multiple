class SmallestMultiple

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

  def find_the_prime_factors_for_each_from_2_to(upto)
    prime_factors_for_upto_set = []
    (2..upto).each do |each_num|
      prime_factors_for_upto_set << find_primes(each_num)
    end
    prime_factors_for_upto_set
  end

  def create_hash_mapping_for_base_exponent(primes_factors_for_upto_set)
    prime_hash_exponent_mapping = []
    primes_factors_for_upto_set.each do |prime_factor_set|
      hash_equivalent = Hash.new(0)
      prime_factor_set.each { |base| hash_equivalent[base] += 1 }
      prime_hash_exponent_mapping << hash_equivalent
    end
    prime_hash_exponent_mapping
  end

  #ASK BEN WHY THE EACH STATEMENT DID NOT WORK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # def compare_the_hashes(array_of_hashes)
  #   array_of_hashes.each do
  #     array_of_hashes[0].merge!(array_of_hashes[1]) { |key, oldval, newval| [newval, oldval].max }
  #     array_of_hashes.delete_at(1)
  #   end
  #   array_of_hashes
  # end

  def merge_w_highest_exponent(hash_base_exponent_mapping)
    while hash_base_exponent_mapping.count != 1 do
      hash_base_exponent_mapping[0].merge!(hash_base_exponent_mapping[1]) { |key, oldval, newval| [newval, oldval].max }
      hash_base_exponent_mapping.delete_at(1)
    end
    hash_base_exponent_mapping
  end

  def lcm_calculation(hash_base_exponent_mapping)
    evaluation = []
    hash_base_exponent_mapping[0].each do |key, value|
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
    step_one = find_the_prime_factors_for_each_from_2_to(upto)
    step_two = create_hash_mapping_for_base_exponent(step_one)
    step_three = merge_w_highest_exponent(step_two)
    lcm_calculation(step_three)
  end

end
