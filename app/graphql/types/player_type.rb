module Types
  class PlayerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :position, Types::PositionType, null: false
    field :team, Types::TeamType, null: false

    def team
      GraphqlLazyLoad::ActiveRecordRelation.new(self, :team)
    end
  end
end
