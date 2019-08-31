module Types
  class PositionType < Types::BaseObject
    field :id, ID, null: false
    field :label, String, null: false
    field :players, [Types::PlayerType], null: false
  end
end
