class ApplicationController < ActionController::API
  # skip_before_action :verify_authenticity_token
  after_action do
    # Axios.... seems to have a bug that if data isnt reset it wont clear it out
    response.set_header('authorization', "") if response.headers['authorization'].blank?
  end

  update_expired_session_tokens!

  catch_invalid_token
  catch_access_denied
  catch_invalid_login
end
