class Api::RecipesController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter
  before_action :doorkeeper_authorize!, only: %w[index show update destroy]
  before_action :current_user_authenticate, only: %w[index show update destroy]

  # jitera-anchor-dont-touch: actions
  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @error_message = true unless @recipe&.destroy
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])

    request = {}
    request.merge!('title' => params.dig(:recipes, :title))
    request.merge!('descriptions' => params.dig(:recipes, :descriptions))
    request.merge!('time' => params.dig(:recipes, :time))
    request.merge!('difficulty' => params.dig(:recipes, :difficulty))
    request.merge!('category_id' => params.dig(:recipes, :category_id))
    request.merge!('user_id' => params.dig(:recipes, :user_id))

    @error_object = @recipe.errors.messages unless @recipe.update(request)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @error_message = true if @recipe.blank?
  end

  def create
    @recipe = Recipe.new

    request = {}
    request.merge!('title' => params.dig(:recipes, :title))
    request.merge!('descriptions' => params.dig(:recipes, :descriptions))
    request.merge!('time' => params.dig(:recipes, :time))
    request.merge!('difficulty' => params.dig(:recipes, :difficulty))
    request.merge!('category_id' => params.dig(:recipes, :category_id))
    request.merge!('user_id' => params.dig(:recipes, :user_id))

    @recipe.assign_attributes(request)
    @error_object = @recipe.errors.messages unless @recipe.save
  end

  def index
    request = {}

    request.merge!('title' => params.dig(:recipes, :title))
    request.merge!('descriptions' => params.dig(:recipes, :descriptions))
    request.merge!('time' => params.dig(:recipes, :time))
    request.merge!('difficulty' => params.dig(:recipes, :difficulty))
    request.merge!('category_id' => params.dig(:recipes, :category_id))
    request.merge!('user_id' => params.dig(:recipes, :user_id))

    @recipes = Recipe.all
  end

  def search
    @recipes = Recipe.all
    title = params[:title]
    @recipes = @recipes.where(title: title) if title

    time_from = params[:time_from]
    time_to = params[:time_to]
    if time_from.present? and time_to.present?
      @recipes = @recipes.where(time: time_from.to_i..time_to.to_i)
    end

    difficulty = params[:difficulty]
    @recipes = @recipes.where(difficulty: difficulty) if difficulty
    @error_message = I18n.t('errors.messages.search_not_found') if @recipes.empty?
  end
end
