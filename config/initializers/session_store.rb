# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_clydetracker_session',
  :secret      => '0173b8efb701bbc6b16850e254f8d5a0d5d567ce3602d76dbc821fe8a8be215e8c54158c93b5aac7993d8b688bbabf501275ad25026d97f7bdfad51323c74c38'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
