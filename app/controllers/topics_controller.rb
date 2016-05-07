class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:show]
  before_action :authenticate_user!, :except => [:show]
  respond_to :html, :json
  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end
  # GET /topics/1
  # GET /topics/1.json
  def show
     topic = Topic.find(params[:id])
     @answers = topic.answers.order(cached_weighted_score: :desc,created_at: :asc)
     @related_questions = Topic.tagged_with(topic.tag_list, :any => true, :wild => true)
     @also_appear_in = Course.joins(:appear_ins).where(appear_ins: {topic_id: topic.id})
     gon.answers = @answers
  end
  # GET /topics/new
  def new
    @user_topics = current_user.topics.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  # GET /topics/1/edit
  def edit
  end

  def create
    topic = Topic.new(topic_params)
    topic.tag_list.add(topic.course.name)
    respond_to do |format|
      if topic.save
        format.html { redirect_to topic, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: topic }
      else
        format.html { render :new }
        format.json { render json: topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    authorize @topic
    flash[:notice] = 'Page was successfully updated.' if @topic.update(topic_params)
    respond_with @topic
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
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:subject, :content, :user_id, {:tag_list => []}, :course_id, :academy_id, :updated_at)
    end
end
