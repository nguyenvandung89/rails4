class CommentsController < VisitorsController
  skip_before_filter :verify_authenticity_token

  def create
    @comment = Comment.new(params.require(:comment).permit(:car_id, :visitor_id, :comments))
    @comment.save
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    @car = @comment.car
    respond_to do |format|
      format.html {redirect_to :back}
    format.js
    end
  end
end