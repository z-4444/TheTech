# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new  #non-logged-in user

      if user.id? and user.is? :admin
        can :manage, :all

      elsif user.id? and user.is? :customer

        can [ :update, :destroy ], Comment do |comment|
          comment.user_id == user.id
        end

        can :read, Product
        can :show, User
        can [:read,:create], Comment
        can [:read],Cart, user_id: user.id
        can [:read,:create,:update,:destroy],Order,user_id: user.id
        can [:read,:create,:update,:destroy,:add_quantity,:reduce_quantity],CartProduct

      elsif user.id? and user.is? :seller
        can [:update, :destroy,:create], Product, :user_id => user.id
        can :read, Product
        can :show, User
        can :read,:myproducts
        can :read, Catagory
        can [:read,:get_subcategory], Subcatagory
        can :read,:admin_dashboard
        can :read ,Cart,user_id: user.id
        can [:read,:create], Comment
        can [:read,:create,:update,:destroy,:add_quantity,:reduce_quantity],CartProduct
        can :read, Product
        can :read,Order, user_id: user.id
      else
        can :read, Product
        can :read, Comment
      end
  end
end
