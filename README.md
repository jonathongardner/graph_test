# GraphTest

This simple rails app is to show how to use [graphql_lazy_load](https://github.com/jonathongardner/graphql_lazy_load) gem. There are two branches `master` (which does not use the lazy executor) and 'lazy-executor' (which yes... uses the lazy executor).

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
