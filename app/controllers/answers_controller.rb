class AnswersController < ApplicationController	
  before_action :set_answer, only: [:show, :update, :edit, :destroy]
  respond_to :html, :json

  def index 
  @answer = Answer.order(:cached_weighted_average => :desc, :created_at => :desc)
  respond_to do |format|
      format.json {render json: @answer.as_json() }
    end
  end
  
  def create
    @answer = Answer.new(answer_params)
    @topic = Topic.find(params[:topic_id])
    @topic.update(:updated_at => Time.now)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.topic, notice: 'Answer was successfully created.' }
        format.js   { }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    flash[:notice] = 'Page was successfully updated.' if @answer.update(answer_params)
    respond_with @answer
  end

  #PUT
  def upvote
    @answer = Answer.find(params[:answer_id])
    @answer.upvote_by current_user
  end

  #PUT
  def downvote
    @answer = Answer.find(params[:answer_id])
    @answer.downvote_by current_user
  end

  def destroy
    authorize @answer
    @answer.destroy
    respond_to do |format|
      format.js { }
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:user_id, :topic_id, :content)
    end
end
