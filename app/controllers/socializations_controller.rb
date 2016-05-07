class SocializationsController < ApplicationController
  before_filter :load_socializable

  def follow
    current_user.follow!(@socializable)
  end

  def unfollow
    current_user.unfollow!(@socializable)
    @followed_course = current_user.followees(Course) 
  end

  def like
    current_user.like!(@socializable)
    @likers = @socializable.likers(User) 
  end

  def unlike
    current_user.unlike!(@socializable)
    @likers = @socializable.likers(User)
  end

  def toggle_like
    current_user.toggle_like!(@socializable)
    @likers = @socializable.likers(User)
  end

private
  def load_socializable
    @socializable =
      case
      when id = params[:course_id] # Must be before :item_id, since it's nested under it.
        Course.find(id)
      when id = params[:item_id]
        @community.items.find(id)
      when id = params[:user_id]
        User.find(id)
      when id = params[:topic_id]
        Topic.find(id)
      when id = params[:answer_id]
        Answer.find(id)
      else
        raise ArgumentError, "Unsupported socializable model, params: " +
                             params.keys.inspect
      end
    raise ActiveRecord::RecordNotFound unless @socializable
  end  
end