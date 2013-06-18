class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :SystemAdmin
      can :manage, :all
    elsif  user.has_role? :user
      can [:index,:show, :new, :create,:myshow], Toon
    #      cannot [:new,:create], Toon
    elsif user.has_role? :Moderator
      can [:index,:show ,:dashboard_moderator, :approve,:new,:create ,:disapprove,:myshow] , Toon
    elsif user.has_role? :Publisher
      can [:index,:show ,:dashboard_publisher, :publish,:new,:create ,:myshow] , Toon

    else
      can [:index,:show , :new , :create,:myshow], Toon
    end
  end

end
