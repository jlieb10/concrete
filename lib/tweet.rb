class TweetClass
  def self.search(words)
    sometweets = []
    $CLIENT.search(words).take(7).map do |tweet|
      if tweet.text.length > 20
        tweet_text = tweet.text.gsub("RT", "").gsub(/\b(http|https).+\w/i, "").gsub(/([\s]\s+)/, " ").gsub(/\@.+\b/, "").strip
        sometweets << "<a href='#{tweet.uri}'>#{tweet_text}</a>"
      end
    end
    sometweets.join(" ")
  end
end
