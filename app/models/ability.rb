class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
      if user.role == "manager"
        can :manage, :all
      elsif user.role == "user"
        can :read, [User, Board, Channels, Post]
        can :create, User
        can :create, Board
      else 
        can :read, [User, Board, Channels, Post]
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
