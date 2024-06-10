class Arabic < ActiveRecord::Base
    def self.words(body)
        # Remove HTML tags
        html_content = body
        doc = Nokogiri::HTML(html_content)
        clean_text = doc.text

        clean_text = clean_text.gsub(/[[:punct:]"“”‘’]/, '')

        words = clean_text.split(/\s+/)
        result = []
        current_index = 0

        words.each do |word|
            word = word.gsub(/\s+/, "")
            word_start_index = clean_text.index(word, current_index)
            word_info = { word: word, index: word_start_index }
            
            if word.start_with?('ال')
            stripped_word = word[2..-1]
            word_info[:stripped] = stripped_word
            end

            result << word_info
            current_index = word_start_index + word.length
        end


        # Modify the original HTML body to wrap each word with data-word attribute
        modified_body = body.dup

        result.reverse.each do |word_info|
        word = word_info[:word]
        index = word_info[:index]

        # Find the exact word in the original body at the specified index
        word_regex = Regexp.new(Regexp.escape(word))
        modified_body = modified_body.sub(word_regex, "<span data-word='#{word}'>#{word}</span>")
        end

        { words: result, body: modified_body }
    end
end