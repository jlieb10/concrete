class TweetClass
  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key = "RJihjlphxnk1BGVUxESbOEpDq"# ENV["TWITTER_KEY"]
    config.consumer_secret = "N9K1lkEEZE0nspZhMo3zaCGC8PpmCXrhFM3xTSFsKBetlhFn2I"#ENV["TWITTER_SECRET"]
  end

  def self.search(words)
    sometweets = []
    CLIENT.search(words).take(7).map do |tweet|
      if tweet.text.length > 20
        tweet_text = tweet.text.gsub("RT", "").gsub(/\b(http|https).+\w/i, "").gsub(/([\s]\s+)/, " ").gsub(/\@.+\b/, "").strip
        sometweets << "<a href='#{tweet.uri}'>#{tweet_text}</a>"
      end
    end
    sometweets.join(" ")
  end
end
