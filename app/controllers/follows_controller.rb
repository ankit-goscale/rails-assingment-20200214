class FollowsController < ApplicationController

  def follow
    @follow = current_user.following_users.build({following_id: params[:following_id]})

    respond_to do |format|
      if @follow.save
        format.html { redirect_to users_path }
        format.json { render json: @follow, status: :ok }
      else
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def un_follow
    @follow = current_user.following_users.find_by({ following_id: params[:following_id] })
    @follow.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
