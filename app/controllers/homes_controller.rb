class HomesController < ApplicationController
  def top
    @tags = Tag.all
    @recipes = Recipe.all.includes([:user]).order(created_at: :desc).limit(4)
    @recipe_ranks = Recipe.create_recipe_ranks
  end

  def about
  end
end
