require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "adigegara",email: "adige@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid? 
  end


  test "CHEFNAME MUST BE PRESENT" do
    @chef.chefname = ""
    assert_not @chef.valid? 
  end
  
  test "chefname must not be too short" do
    @chef.chefname = "a"
    assert_not @chef.valid? 
    
  end
  
  test "chefname must not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid? 
  end
  
  test "email must be present" do
    @chef.email = ""
    assert_not @chef.valid? 
  end
  
  test "email must be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
    
  end

  test "email validation should accept valid addresses" do 
    valid_addresses = %w[user@example.com tdddf@exam.com] 
    valid_addresses.each do |va| 
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
        
    end
  end
  
  test "email should reject invalid address" do
    invalid_addresses = %w[asdfa @adfasdf adsaaa.orf]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should in invalid' 
    end
    
  end

end