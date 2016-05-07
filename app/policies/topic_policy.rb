class TopicPolicy < Struct.new(:user, :topic)
  
  def owned
    @current_user = user
    topic.user_id == user.id
  end

  def create?
    topic.user_id = user.id
    new?
  end

  def new?
    true
  end

  def update?
   edit?
  end

  def edit?
    owned or @current_user.admin?
  end

  def destroy?
    owned
  end

end 