class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    case user.role
    when 'admin'
      can :manage, :all
    when 'moderator'
      can :manage, :all
    when 'user'
      can :read, :all
      can :manage, Post, user_id: user.id
    else
      can :read, Post
    end
  end
end
