class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  def index
    @tweets = Tweet.all
  end
  def show
  end
  def new
    @tweet = Tweet.new
  end
  def edit
  end
  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'The tweet was created SUCCESSFULLY.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end
  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'The tweet was updated SUCCESSFULLY.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'The tweet was deleted SUCCESSFULLY.' }
      format.json { head :no_content }
    end
  end
  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
