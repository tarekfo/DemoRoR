# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shoppeur_session',
  :secret      => '38e5db47ec172bb14af0b474b683329dd5c6a50d717e1fe0db2ce711196e6bbf2f89512d950605c13e4c6a6d00bee985ead1365414ba3ee80e0648be1ae480dd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
