# app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
    # swagger_controller :tweets, "Tweets Management"

    before_action :sign_in_to_account
    before_action :set_tweet, only: [:edit, :update, :destroy]

    # GET /api/v1/tweets
    # swagger_api :index do
    #     summary "Fetches all tweets"
    #     response :ok, "Success", :Tweet
    #     response :unauthorized
    # end
    def index
        @tweets = Current.user.tweets
    end

    # GET /api/v1/tweets/new
    def new
        @tweet = Tweet.new
    end

    # GET /api/v1/tweets/:id/edit
    def edit
    end

    # PATCH /api/v1/tweets/:id
    def update
        if @tweet.update(tweet_params)
          redirect_to tweets_path, notice: "Tweet was updated successfully"
        else
          render :edit
        end
    end

    # DELETE /api/v1/tweets/:id
    def destroy
        @tweet.destroy
        redirect_to tweets_path, notice: "Tweet was unscheduled"
    end

    # POST /api/v1/tweets
    def create
        @tweet = Current.user.tweets.new(tweet_params)
        if @tweet.save
          redirect_to tweets_path, notice: "Tweet was scheduled successfully"
        else
          render :new
        end
    end

    private

    def tweet_params
      params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
    end

    def set_tweet
        @tweet = Current.user.tweets.find(params[:id])
    end
end