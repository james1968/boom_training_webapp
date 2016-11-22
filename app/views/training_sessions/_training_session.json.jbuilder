json.extract! training_session, :id, :name, :start_time, :created_at, :updated_at
json.url training_session_url(training_session, format: :json)