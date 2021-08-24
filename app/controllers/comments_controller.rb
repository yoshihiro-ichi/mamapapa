class CommentsController < ApplicationController
 before_action :set_facility, only: [:create, :edit, :update]
 before_action :authenticate_user!


  def create
    @comment = @facility.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
# binding.pry
        format.js{render :index}
      else
        format.html{ redirect_to facility_path(@facility),notice:'投稿できませんでした'}
      end
    end
  end
  def edit

   @comment = @facility.comments.find(params[:id])
    respond_to do |format|
     flash.now[:notice] = 'コメントの編集中'
     format.js { render :edit }
    end
  end

   def update
     @comment = @facility.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
       else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
   end
   def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:facility_id, :user_id,:content)
  end
  def set_facility
    @facility = Facility.find(params[:facility_id])
  end
end
