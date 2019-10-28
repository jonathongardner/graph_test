module Types
  class QueryType < Types::BaseObject
    required_permission :anyone
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :teams, [Types::TeamType], null: false, description: "Many teams"
    def teams
      Team.all
    end

    field :players, [Types::PlayerType], null: false, description: "Players anyone can see", required_permission: :anyone
    def players
      Player.all
    end

    field :special_players, [Types::SpecialPlayerType], null: false, description: "Players on valid users can see"
    def special_players
      Player.all
    end

    field :super_special_players, [Types::SuperSpecialPlayerType], null: false, description: "Players only admins can see"
    def super_special_players
      Player.all
    end

    field :current_user, Types::UserType, null: true, description: 'Current user', required_permission: :anyone
    def current_user
      context[:current_user]
    end
  end
end
