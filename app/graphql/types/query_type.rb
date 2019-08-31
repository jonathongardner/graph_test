module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :teams, [Types::TeamType], null: false, description: "Many teams"
    def teams
      Team.all
    end

    field :players, [Types::PlayerType], null: false, description: "Many players"
    def players
      Player.all
    end
  end
end
