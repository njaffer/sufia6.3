class Ability
  include Hydra::Ability
  include Sufia::Ability

  def featured_work_abilities
	  if current_user.admin?
	      can [:create, :destroy, :update], FeaturedWork 
	    end
  end
	    def editor_abilities
   if current_user.admin?
	             can :create, TinymceAsset
	             can :update, ContentBlock
	           end
    end

	  def stats_abilities
    alias_action :stats, to: :read
  end
  # Define any customized permissions here.
  def custom_permissions
    # Limits deleting objects to a the admin user
    #
    # if current_user.admin?
    #   can [:destroy], ActiveFedora::Base
    # end
if current_user.admin?
	    can [:create, :show, :add_user, :remove_user, :index], Role
	      end
    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end



  end
end
