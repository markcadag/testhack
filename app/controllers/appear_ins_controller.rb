class AppearInsController < ApplicationController
  respond_to :js

  def new
  end

  def create
    @appear_in = AppearIn.new
    @appear_in.course_id = params[:appear_in][:course_id] 
    @appear_in.topic_id = params[:appear_in][:topic_id] 
    @appear_in.user_id = current_user.id
    @appear_in.save
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appear_in_params
      params.require(:appear_ins).permit(:topic_id, :course_id)
    end
end
