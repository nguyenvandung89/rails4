class LikesController < VisitorsController
  skip_before_filter :verify_authenticity_token
  def create
    @like = Like.create(params.require(:like).permit(:car_id, :visitor_id))
    @car = @like.car
    respond_to do |format|
      format.js
      format.html {redirect_to :back}
    end
  end

  def destroy
    like = Like.find(params[:id]).destroy
    @car = like.car
    respond_to do |format|
      format.js
      format.html {redirect_to :back}
    end
  end
end