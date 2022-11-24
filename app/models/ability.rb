# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new  #non-logged-in user

      if user.id? and user.is? :customer
  
        can [:update, :destroy,:create], Product, :user_id => user.id
       
        can [ :update, :destroy ], Comment do |comment|
          comment.user_id == user.id
        end

        can :read, Product
        can [:read,:create], Comment
        can [:read,:create,:update,:destroy,:add_quantity,:reduce_quantity],CartProduct
        can [:read],Cart, user_id: user.id
        can :manage,Order
      else
        can :read, Product
        can :read, Comment
      end
      if user.id? and user.is? :admin
        can :manage, :all
      end
  end
end
