class MainController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    if user_signed_in? && current_user.activities.count > 0
      # Pulling in Activity objects for user and connections
      user_ids_for_feed = []
      user_ids_for_feed.push current_user.id

      current_user.friends.each do |friend|
        user_ids_for_feed.push friend.id
      end

      @activities = Activity.
        where(:user_id => user_ids_for_feed).
        order("updated_at DESC").
        page(params[:page]).
        per(25)


      # Adding in Recommendation Requests
      @recommendation_requests = RecommendationRequest.
        where(:recommender_user_id => current_user.id,
              :completed => false)
    else
      # Shows recently recommended books if not logged in or no activity
      @books = Book.order("updated_at DESC").page(params[:page]).per(10)
    end

    if (user_signed_in?)
      @recommendations = Recommendation.where(
        :requestor_user_id => current_user.id, :processed => false)

      if (!@recommendations.nil?)
        @recommendations.each do |recommendation|
          book = Book.find(recommendation.book_id);
          recommender = User.find(recommendation.recommender_user_id)
          recommendation[:title] = book.title
          recommendation[:author] = book.author
          recommendation[:image_url] = book.image_url
          recommendation[:recommender] =
            "#{recommender.first} #{recommender.last} (#{recommender.email})";
          recommendation[:recommender_short] =
            "#{recommender.first} #{recommender.last}";
        end

        # could limit this to only if count_incoming_requests > 0 and/or just to mobile
        @recommendation_requests = RecommendationRequest.
          where(:recommender_user_id => current_user.id,
                :completed => false)
        @requestor_name = {}

        @recommendation_requests.each do |recommendation_request|
          requestor_user = User.find(recommendation_request.requestor_user_id)
          @requestor_name[recommendation_request.id] =
            "#{requestor_user.first} #{requestor_user.last} (#{requestor_user.email})";
        end
      end
    end

    respond_to do |format|
      format.html
      format.mobile
    end
  end
end
