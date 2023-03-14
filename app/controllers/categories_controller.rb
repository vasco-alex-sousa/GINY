class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def search
    @query = params[:query]
    @categories = @query.presence ? Category.where("lower(name) LIKE ?", "%#{@query.downcase}%") : []
    @channels = @query.presence ? User.where("lower(display_name) LIKE ?", "%#{@query.downcase}%") : []
  end
end
