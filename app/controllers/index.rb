$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

get "/" do
  # this should return us our last 20 tweets
  @tweets = $client.user_timeline.map { |tweet| tweet.text }
  erb :index
end

post "/tweet" do
  # this should send out a tweet
  $client.update(params[:tweet])
  redirect "/"
end


