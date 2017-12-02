class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
      if user.role == "manager"
        can :manage, :all
      elsif user.role == "user"
        can :read, [Board, Channel, Post]
        can :create, Board
        can :create, Post
        can :create, User
        can :update, Board do |board|
          board.user == user
        end
        can :destroy, Board do |board|
          board.user == user
        end
        can :update, Post do |post|
          post.user == user
        end
        can :destroy, Post do |post|
          post.user == user
        end
        can :show, User do |i|
          i.id == user.id
        end
        can :update, User do |i|
          i.id == user.id
        end
      elsif user.role == "terminated"
        can :read, [Board, Channel, Post]
      else
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
