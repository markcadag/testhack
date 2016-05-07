class CommentsController < ApplicationController
  before_action :set_comments, only: [:show, :edit, :update, :destroy]

  # GET /comments/1
  # GET /comments/1.json
  def index
    @topic = Topic.find(params[:topic_id])
    @comments = @topic.root_comments
  end

  def show
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments
      @course = Comment.find(params[:id])
    end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def course_params
    #   params.require(:course).permit(:name)
    # end
end
