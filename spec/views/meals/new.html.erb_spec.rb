require 'spec_helper'

describe "meals/new" do
  before(:each) do
    assign(:meal, stub_model(Meal,
      :name => "MyString",
      :price => "9.99",
      :description => "MyText",
      :restaurant => nil
    ).as_new_record)
  end

  it "renders new meal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => meals_path, :method => "post" do
      assert_select "input#meal_name", :name => "meal[name]"
      assert_select "input#meal_price", :name => "meal[price]"
      assert_select "textarea#meal_description", :name => "meal[description]"
      assert_select "input#meal_restaurant", :name => "meal[restaurant]"
    end
  end
end
