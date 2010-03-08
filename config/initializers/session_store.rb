# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_timesheet3_session',
  :secret => '62a8bbc4f547d94b9b067ddd1996e8e24f9471e9e9c80e7dca1fe5f1767d625e897ca955ddf3285aeb392bb44bc5ce92256958e8829d093a4ed41de99e878e18'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
