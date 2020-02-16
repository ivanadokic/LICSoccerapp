

Rails.application.config.middleware.use OmniAuth::Builder do

    # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
    provider :google_oauth2, ENV['GOOGLE_CLIENT'], ENV['GOOGLE_SECRET'], scope: "user,repo,gist", skip_jwt: true
  end



