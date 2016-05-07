class UserPolicy < Struct.new(:user , :current_user)
  
  def owned
    current_user.id == user.id
  end

  def create?
    current_user.id = user.id
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