# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(account)

    # Define abilities for the passed in user here. For example:

     if account.type == "Accounts::Employee"
        account.roles
     elsif account.type == "Accounts::Supplier"

     elsif account.type == "Accounts::Customer"

     elsif account.type == "Accounts::Banker"

     elsif account.type == "Accounts::Auditor"

     elsif account.type == "Accounts::Guest"

     else
       account.type = "Accounts::Guest"
     end

    #   if user.has_role? :admin
    #      can :manage, :all
    #   else
    #      can :read, Forum
    #      can :write, Forum if user.has_role?(:moderator, Forum)
    #      can :write, Forum, :id => Forum.with_role(:moderator, user).pluck(:id)
    #   end
    #
    #
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
