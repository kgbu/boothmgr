# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_attend_session',
  :secret      => '5a3a51c0f39b5594ef3bc8161229dd4a565c1c30f15be67ac57c4c146b67fe99599bc4cede653166c01168ac5d1c819deb5c4dc4ad2a4471ee9142a56a6909f6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
