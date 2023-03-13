class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def search
    @query = params[:query]
    @categories = Category.where("lower(name) LIKE ?", "%#{@query.downcase if !@query.nil?}%") || []
    @channels = User.where("lower(display_name) LIKE ?", "%#{@query.downcase if !@query.nil?}%")
  end
end
