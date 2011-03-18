module YoudaoTranslate
  class YoudaoSentence
    def self.search(text, language = "eng")
      path = "http://fanyi.youdao.com/translate?smartresult=dict&type=AUTO&i=#{CGI.escape(text)}&ue=utf8"
      page = Nokogiri::HTML(open(path))
      result = page.css(".translated_result .tgt").text
      p result
    end
  end
end