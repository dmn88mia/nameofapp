require 'rails_helper'

describe Product do

  context "when the product has comments" do
    
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "Awful Bike!")
      @product.comments.create!(rating: 3, user: @user, body: "Terrible Bike!")
      @product.comments.create!(rating: 5, user: @user, body: "Crap Bike!")
    end

    it "returns the average rating of all comments" do 
      expect(@product.average_rating).to eq(3)
    end
   end
  
  context "product not valid" do
  
    it "is invalid when name is missing" do 
      @product = FactoryGirl.build(:product, name: "")
      expect(Product.new(name: "", description: "Nice bike")).not_to be_valid
    end

  end 

end  
