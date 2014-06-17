class Word
  def self.random
    all_words = []
    search_words = []
    w = File.open("./db/words")
      w.each_line do |line|
        all_words << line
      end
    w.close
    search_words = all_words.sample(2).map do |word|
      word.strip.capitalize
    end
    search_words
  end
end
