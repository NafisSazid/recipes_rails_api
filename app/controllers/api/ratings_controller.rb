class Api::RatingsController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter

  # jitera-anchor-dont-touch: actions
  def destroy
    @rating = Rating.find_by(id: params[:id])

    @error_message = true unless @rating&.destroy
  end

  def update
    @rating = Rating.find_by(id: params[:id])

    request = {}
    request.merge!('score' => params.dig(:ratings, :score))

    @error_object = @rating.errors.messages unless @rating.update(request)
  end

  def show
    @rating = Rating.find_by(id: params[:id])
    @error_message = true if @rating.blank?
  end

  def create
    @rating = Rating.new
    attrs = {}
    attrs.merge!(score: params.dig(:ratings, :score))
    attrs.merge!(user_id: params.dig(:ratings, :user_id))
    attrs.merge!(recipe_id: params.dig(:ratings, :recipe_id))

    @rating.assign_attributes(attrs)

    @rating.save!
  end

  def index
    request = {}
    request.merge!('score' => params.dig(:ratings, :score))
    request.merge!('user_id' => params.dig(:ratings, :user_id))
    request.merge!('recipe_id' => params.dig(:ratings, :recipe_id))

    @ratings = Rating.all
  end
end

