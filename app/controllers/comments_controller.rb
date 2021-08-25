class CommentsController < ApplicationController
 before_action :set_facility, only: [:create, :edit, :update]
 before_action :authenticate_user!

  def create
    @comment = @facility.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js{render :index}
      else
          flash.now[:alert] = '投稿できませんでした'
          format.js { render :index }
      end
    end
  end
  def edit

   @comment = @facility.comments.find(params[:id])
    respond_to do |format|
      format.js { render :edit }
    end
  end

   def update
     @comment = @facility.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:alert] = 'コメントが編集されました'
          format.js { render :index }
       else
          flash.now[:alert] = 'コメントの編集に失敗しました'
          format.js { render :index }
        end
      end
   end
   def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:alert] = 'コメントが削除されました'
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
