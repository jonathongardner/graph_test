GraphiQL::Rails.config.headers['Authorization'] = -> (context) do
  username = context.params['username']
  return '' unless username.present?
  "Bearer token=#{User.find_by(username: username)&.create_token(false)}"
end
GraphiQL::Rails.config.initial_query = %q{# Welcome to GraphiQL on graph_test
#
# GraphiQL is an in-browser tool for writing, validating, and
# testing GraphQL queries.
#
# Type queries into this side of the screen, and you will see intelligent
# typeaheads aware of the current GraphQL type schema and live syntax and
# validation errors highlighted within the text.
#
# Keyboard shortcuts:
#
#                     Run Query:  Ctrl-Enter (or press the play button above)
# (Un)Comment Highlighted Block:  Ctrl-/
#
# Must be an authorized user to run N + 1 Queries: http://localhost:3000/graphiql?username=generic
# Example Queries:
#
# N + 1 Queries
# {
#   players {
#     name
#     team {
#       name
#       players(limit: 5, page: 2, order: "name") {
#         name
#         team {
#           name
#         }
#       }
#       friends:players(name: "Juan R") {
#         name
#       }
#     }
#   }
# }
#
# Custom vs Association
# {
#   teams {
#     id
#     players {
#       id
#       position {
#         id
#         players {
#           id
#         }
#       }
#       team {
#         id
#       }
#     }
#     playersCustom {
#       id
#       positionCustom {
#         id
#         playersCustom {
#           id
#         }
#       }
#       teamCustom {
#         id
#       }
#     }
#   }
# }
#
# Unauthorized (http://localhost:3000/graphiql)
# {
#   players {
#     name
#   }
# }
#
# Generic User (http://localhost:3000/graphiql?username=generic)
# {
#   players {
#     name
#     specialName
#   }
#   specialPlayers {
#     name
#   }
# }
#
# Admin User (http://localhost:3000/graphiql?username=admin)
# {
#   players {
#     name
#     specialName
#     superSpecialName
#   }
#   specialPlayers {
#     name
#   }
#   superSpecialPlayers {
#     name
#   }
# }
}
