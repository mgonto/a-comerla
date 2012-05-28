require 'pry'
class OrderController < LoggedInController
  def index
    @restaurants = Restaurant.all
    @orders = Order.find_active
  end

  def new
    find_restaurant
  end

  def finalize
    find_restaurant
    find_meal
    @order = Order.new
    unless @meal
      not_found
    end
  end

  def create
    find_restaurant
    find_meal
    binding.pry
    @order = Order.new(:end_date => Time.new + params[:minutes_remaining].to_i.minutes, :restaurant => @restaurant)
    @order.dish_orders.build(:user => current_user, :meal => @meal)
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Order created' }
        format.json { render json: @order, status: :created }
      else
        format.html { render action: "finalize" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def find_restaurant
    @restaurant = Restaurant.find_by_id(params[:restaurant_id]) || not_found
  end

  def find_meal
    @meal = @restaurant.meals.where(:id => params[:meal_id]).first || not_found
  end
end

