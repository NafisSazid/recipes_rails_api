class Api::CategoriesController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter

  # jitera-anchor-dont-touch: actions
  # TODO: Have to add Doorkeeper Authorization in all the apis where missing
  def destroy
    @category = Category.find_by(id: params[:id])

    @error_message = true unless @category&.destroy
  end

  def update
    @category = Category.find_by(id: params[:id])

    request = {}
    request.merge!('description' => params.dig(:categories, :description))

    @error_object = @category.errors.messages unless @category.update(request)
  end

  def show
    @category = Category.find_by(id: params[:id])
    @error_message = true if @category.blank?
  end

  def create
    @category = Category.new

    request = {}
    request.merge!('description' => params.dig(:categories, :description))

    @category.assign_attributes(request)
    @error_object = @category.errors.messages unless @category.save
  end

  def index
    request = {}
    request.merge!('description' => params.dig(:categories, :description))

    @categories = Category.all
  end
end
