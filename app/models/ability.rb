class Ability
  include CanCan::Ability
  
  def initialize(user)
    
    can :read, Post
    can :manage, Post if user
  end
end