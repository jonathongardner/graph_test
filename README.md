# GraphTest

This simple rails app is to show how to use [graphql_lazy_load](https://github.com/jonathongardner/graphql_lazy_load) and [slots-jwt](https://github.com/jonathongardner/slots-jwt) gem. There are two branches `master` (which does not use the lazy executor) and `lazy-executor` (which yes... uses the lazy executor).

# Setup
```BASH
git clone https://github.com/jonathongardner/graph_test
cd graph_test
bundle install
rake db:setup
rails s
```

Now navigate to the graphiql (http://localhost:3000/graphiql) and start running queries. Next checkout `lazy-executor` branch and see N+1 queries disappear!

# Example
A good query to see N+1 queries disappear is:
```graphql
{
  players {
    name
    team {
      name
      players(limit: 5, page: 2, order: "name") {
        name
        team {
          name
        }
      }
      friends:players(name: "Juan R") {
        name
      }
    }
  }
}
```

A good query to see custom vs association is:
```graphql
{
  teams {
    id
    players {
      id
      position {
        id
        players {
          id
        }
      }
      team {
        id
      }
    }
    playersCustom {
      id
      positionCustom {
        id
        playersCustom {
          id
        }
      }
      teamCustom {
        id
      }
    }
  }
}
```

Everything you can do with association graphql_lazy_load you can do with custom, but custom has more freedom to do more things.

# Slots-JWT
Both branches use slots-jwt and graphql-ruby features to help with authentication and authorization. The following queries can only be ran if a valid token is passed.
#### Unauthorized
http://localhost:3000/graphiql
```graphql
{
  players {
    name
  }
}
```
#### Generic User
http://localhost:3000/graphiql?username=generic
```graphql
{
  players {
    name
    specialName
  }
  specialPlayers {
    name
  }
}
```
#### Admin User
http://localhost:3000/graphiql?username=admin
```graphql
{
  players {
    name
    specialName
    superSpecialName
  }
  specialPlayers {
    name
  }
  superSpecialPlayers {
    name
  }
}
```
## Authenticated Request
This easiest way to test queries as different users is to pass the username as a url param in GraphiQL (this was setup using the initializers/graphiql.rb). To see how to make authenticated request outside of GraphiQL use the [slots-jwt](https://github.com/jonathongardner/slots-jwt) documentation.
