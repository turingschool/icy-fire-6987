class DishController < ActionController
  def index
    @dishes = Dish.all
  end
  
  def show 
    @dish = Dish.find(params[:id])
  end

  def new
  end

  def update
  end

  private
  def dish_params
    params.require(:dish).permit(:name, :description
  end
end
