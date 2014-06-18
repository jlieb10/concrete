require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module PoemApp
  class App < Sinatra::Application
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    get '/' do
      @randwords = Word.random
      @randwords = @randwords.join(" ")
      @randtweets = TweetClass.search(@randwords)
      erb :index
    end

    post '/' do
      erb :index
    end

  end
end
