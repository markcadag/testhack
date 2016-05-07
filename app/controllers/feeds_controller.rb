class FeedsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  
  # GET /feeds
  # GET /feeds.json
  def index
    @courses = Course.all
    @followed_course = current_user.followees(Course)
    @user_courses = current_user.courses
    @preparing_for = Course.joins(:test_preparings).where(test_preparings: {user_id: current_user.id, primary_preparing: true}).first
    @top_topics = Topic.top_topics
    @hot_topics = Topic.hot_topics
    @weekly_topics =  Topic.weekly_topics
    # @followed = current_user.courses.order('updated_at DESC').first
    @trending_courses = Course.order('followers_count DESC').limit(10)
    if @preparing_for.present?
    @user_also_takings = User.includes(:academies).joins(:test_preparings)
      .select("users.first_name, users.id").where(test_preparings: {course_id: @preparing_for.id})
      if @preparing_for.present?
        @recent_course_question = Topic.includes(:course).order('created_at DESC').where(course_id: @preparing_for.id).limit(10)
      end
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:user_id, :topic_id, :title)
    end
end
