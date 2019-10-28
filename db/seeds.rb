# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.find_or_create_by!(username: 'generic') do |user|
  user.password = 'password'
  user.email = 'generic@somewhere.com'
end
User.find_or_create_by!(username: 'admin') do |user|
  user.password = 'password'
  user.email = 'admin@somewhere.com'
  user.admin = true
end

qb = Position.find_or_create_by!(label: 'Quarterback')
rb = Position.find_or_create_by!(label: 'Running Back')
wr = Position.find_or_create_by!(label: 'Wide Reciever')
s = Position.find_or_create_by!(label: 'Safety')
cb = Position.find_or_create_by!(label: 'Cornerback')
lb = Position.find_or_create_by!(label: 'Linebacker')

eagles = Team.find_or_create_by!(name: 'Eagles')
falcons = Team.find_or_create_by!(name: 'Falcons')

Player.find_or_create_by!(
  name: 'Jon G',
  number: "5",
  team: falcons,
  position: wr,
)
Player.find_or_create_by!(
  name: 'Caleb B',
  number: "47",
  team: falcons,
  position: rb,
)
Player.find_or_create_by!(
  name: 'Preston H',
  number: "37",
  team: falcons,
  position: wr,
)
Player.find_or_create_by!(
  name: 'Juan R',
  number: "24",
  team: falcons,
  position: qb,
)
Player.find_or_create_by!(
  name: 'Justin M',
  number: "24",
  team: falcons,
  position: wr,
)
Player.find_or_create_by!(
  name: 'Brooks M',
  number: "32",
  team: falcons,
  position: wr,
)
Player.find_or_create_by!(
  name: 'Eddie G',
  number: "25",
  team: falcons,
  position: cb,
)
Player.find_or_create_by!(
  name: 'Andrew S',
  number: "12",
  team: falcons,
  position: qb,
)
Player.find_or_create_by!(
  name: 'Bennett T',
  number: "22",
  team: falcons,
  position: s,
)
Player.find_or_create_by!(
  name: 'Bennett T',
  number: "22",
  team: falcons,
  position: s,
)
Player.find_or_create_by!(
  name: 'Jordan J',
  number: "8",
  team: falcons,
  position: s,
)
Player.find_or_create_by!(
  name: 'Aaron S',
  number: "22",
  team: falcons,
  position: lb,
)

Player.find_or_create_by!(
  name: 'John H',
  number: "32",
  team: eagles,
  position: wr,
)
Player.find_or_create_by!(
  name: 'Mike H',
  number: "25",
  team: falcons,
  position: cb,
)
