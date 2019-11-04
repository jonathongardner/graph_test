class GraphqlController < ApplicationController
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    Rails.logger.info('----------------------------------')
    Rails.logger.info("#{current_user&.username}")
    context = {
      current_user: current_user,# can be nil if current_user bad token or no token
    }
    # https://github.com/rmosolgo/graphql-ruby/blob/master/guides/schema/limiting_visibility.md
    filter = Filter.new(current_user)
    result = GraphTestSchema.execute(query, only: filter, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue Slots::JWT::InvalidToken, Slots::JWT::AuthenticationFailed
    raise
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
