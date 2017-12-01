class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
      if user.role == "manager"
        can :manage, :all
      elsif user.role == "employee"
        can :read, [Board, Channel, Post]
        can :create, Board
        can :create, Post
        can :create, User
      elsif
        can :read, [Board, Channel, Post]
        can :create, User
      end

    #lower to higher permissions approach if we wanna do it this way
    # unless user
    #     can :read, :all
    #     can :create, :users
    #   else
    #     can :read, :all
    #     can :create, User
    #     can :create, Board
    #   if user.role == "manager"
    #     can :manange, :all
    #   end
    # end
  end
end
