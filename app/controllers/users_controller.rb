class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  # GET /topics
  # GET /topics.json
  def index
    @users = User.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @preparing_for = Course.joins(:test_preparings).where(test_preparings: {user_id: current_user.id, primary_preparing: true}).first
    if @preparing_for.present?
      @questions = @user.topics.order('updated_at DESC').where(course_id: @preparing_for.id)
      @answers = Answer.order('updated_at DESC').where(user_id: params[:id])
      @user_preparings = User.joins(:test_preparings).select("users.first_name, users.id").where(test_preparings: {course_id: @preparing_for.id})
    end
    @history = Topic.order('created_at DESC').where(user_id: params[:id])
    @followed_courses = @user.followees(Course)
    respond_to do |format|
      format.html
      format.json { render json: @user.as_json() }
    end
  end

  # GET /topics/new
  def new
    @user = User.new
  end

  # GET /topics/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @user = User.new(user_params)
    @test_preparing = TestPreparing.new
    @test_preparing.course_id = params[:course_id]
    @test_preparing.user_id = @user.id
    @test_preparing.primary_preparing = true

    respond_to do |format|
      if @user.save
        @test_preparing.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    authorize @user
    flash[:notice] = 'User was successfully updated.' if @user.update(user_params) 
      @user.avatar = params[:avatar]
      @user.save!
    respond_with @user
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    authorize @topic
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :courses, :academies, :first_name, :last_name, :avatar, :course_id, :tag_list)
    end
end
