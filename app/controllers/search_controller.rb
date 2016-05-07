class SearchController < ApplicationController
  respond_to :html
	
	def course
	    @course = Course.search(params[:q]).limit(10)
	    respond_to do |format|
	          format.html
	          format.json { render json: @course.as_json() }
    	end
  	end

  	def academy
  		@academies = Academy.search(params[:q]).limit(10)
	    respond_to do |format|
	          format.html
	          format.json { render json: @academies.as_json() }
    	end
  	end

  	def topic
	    @topic = Topic.search(params[:q])
	    respond_to do |format|
	          format.html
	          format.json { render json: @topic.as_json() }
    	end
  	end

end