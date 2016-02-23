require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "ram", email: "ram@example.com")
    @chef.save
    @recipe = @chef.recipes.build(name: "chitranna ", summary: "chitranna is also called as lemon rice", 
              discription: "first tu rice boil maadu adhmale vagarne haaku. nimbehannu hindu 
              adhmelle sariyagi mix maadu ")
  end
 
  test "chef id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test "name must not be too short" do
    @recipe.name = "as"
    assert_not @recipe.valid?
  end
  
  test "name mustnot be too long" do
    @recipe.name = 'a' * 101
    assert_not @recipe.valid?
  end
 
  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
 
  test "summary should not be too short" do
    @recipe.summary = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "symmary should not be too long" do
    @recipe.summary = 'a' * 251
    assert_not @recipe.valid?
  end
  
  test "discription should be present" do
    @recipe.discription = ''
    assert_not @recipe.valid?
  end
 
  test "discription should not be too short" do
    @recipe.discription = 'a' * 1
    assert_not @recipe.valid?
  end
  
  test "should not be too long" do
    @recipe.discription = 'a' * 1110
    assert_not @recipe.valid?
  end
    
    
end