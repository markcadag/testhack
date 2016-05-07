class AcademiesController < ActionController::Base
  
  def show
  end
  
  def new
    @academy = Academy.new
  end

  def create
    @academy = Academy.new(academy_params)
    respond_to do |format|
      if @academy.save
        format.html { redirect_to @academy, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @academy.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_feed
    #   @feed = Feed.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_params
      params.require(:academy).permit(:name)
    end

end
   

