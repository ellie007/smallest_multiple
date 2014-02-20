# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require 'smallest_multiple'

describe SmallestMultiple do

  let(:test) { SmallestMultiple.new }

  it "prime factor of 2 is [2]" do
    test.find_primes(2).should == [2]
  end
  it "prime factors of 3 is [3]" do
    test.find_primes(3).should == [3]
  end
  it "prime factors of 4 is [2, 2]" do
    test.find_primes(4).should == [2, 2]
  end
  it "prime factors 63 is [3, 3, 7]" do
    test.find_primes(63).should == [3, 3, 7]
  end

  it "find the primes factors for each between 2 to 4" do
    test.pass_in_a_group_of_nums_to_find_the_prime_factors(4).should == [[2], [3], [2, 2]]
  end

  it "makes the primes into hashes" do
    test.count_identical_elements_in_array_and_create_hash([[2, 3, 3, 4, 4], [2, 2, 3]]).should == [{2=>1, 3=>2, 4=>2}, {2=>2, 3=>1}]
  end

  it "merges the hashes together giving the highest factor in each number" do
    test.compare_the_hashes([{2=>1, 3=>2, 4=>2}, {2=>2, 3=>1}]).should == [{2=>2, 3=>2, 4=>2}]
  end

  it "merges the hashes together giving the highest factor in each number" do
    test.compare_the_hashes([{2=>1, 3=>2, 4=>2}, {2=>2, 3=>1}]).should == [{2=>2, 3=>2, 4=>2}]
  end

  it "merges the hashes together giving the highest factor in each number" do
    test.compare_the_hashes([{2=>1},{3=>1},{2=>2},{5=>1},{2=>1, 3=>1},{7=>1},{2=>3},{3=>2},{2=>1, 5=>1}]).should == [{2=>3, 3=>2, 5=>1, 7=>1}]
  end

  it "does final calculation" do
    test.does_calculation([{2=>2, 3=>2, 4=>2}]).should == 576
  end

  it "return 2520 as the LCM of all from 1 to 10" do
    test.project_euler_solution(10).should == 2520
  end

  it "return XXXXXXXX as the LCM of all from 1 to 20" do
    test.project_euler_solution(20).should == 232792560
  end

end

