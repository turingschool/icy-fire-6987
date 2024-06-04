class IngredientsController < ApplicationController
    def index
        @chef = Chef.find(params[:chef_id])
        @ingredients = Chef.unique_ingredients(@chef.id)
    end
end