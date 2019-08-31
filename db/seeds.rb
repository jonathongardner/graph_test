# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
qb = Position.create!(label: 'Quarterback')
rb = Position.create!(label: 'Running Back')
wr = Position.create!(label: 'Wide Reciever')
s = Position.create!(label: 'Safety')
cb = Position.create!(label: 'Cornerback')
lb = Position.create!(label: 'Linebacker')

eagles = Team.create!(name: 'Eagles')
falcons = Team.create!(name: 'Falcons')

Player.create!(
  name: 'Jon G',
  number: "5",
  team: falcons,
  position: wr,
)
Player.create!(
  name: 'Caleb B',
  number: "47",
  team: falcons,
  position: rb,
)
Player.create!(
  name: 'Preston H',
  number: "37",
  team: falcons,
  position: wr,
)
Player.create!(
  name: 'Juan R',
  number: "24",
  team: falcons,
  position: qb,
)
Player.create!(
  name: 'Justin M',
  number: "24",
  team: falcons,
  position: wr,
)
Player.create!(
  name: 'Brooks M',
  number: "32",
  team: falcons,
  position: wr,
)
Player.create!(
  name: 'Eddie G',
  number: "25",
  team: falcons,
  position: cb,
)
Player.create!(
  name: 'Andrew S',
  number: "12",
  team: falcons,
  position: qb,
)
Player.create!(
  name: 'Bennett T',
  number: "22",
  team: falcons,
  position: s,
)
Player.create!(
  name: 'Bennett T',
  number: "22",
  team: falcons,
  position: s,
)
Player.create!(
  name: 'Jordan J',
  number: "8",
  team: falcons,
  position: s,
)
Player.create!(
  name: 'Aaron S',
  number: "22",
  team: falcons,
  position: lb,
)

Player.create!(
  name: 'John H',
  number: "32",
  team: eagles,
  position: wr,
)
Player.create!(
  name: 'Mike H',
  number: "25",
  team: falcons,
  position: cb,
)
