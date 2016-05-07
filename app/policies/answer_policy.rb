class AnswerPolicy < Struct.new(:user, :answer)
  
  def owned
    answer.user_id == user.id
  end

  def create?
    answer.user_id = user.id
    new?
  end

  def new?
    true
  end

  def update?
   edit?
  end

  def edit?
    owned
  end

  def destroy?
    owned
  end

end 