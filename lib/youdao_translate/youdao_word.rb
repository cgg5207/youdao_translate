module YoudaoTranslate
  class YoudaoWord
    include Command

    def self.search(q, language = "eng")
      options = Command.parse(ARGV)
      puts options.basic
      p ARGV
=begin
      path = "http://dict.youdao.com/search?le=#{language}&q=#{CGI.escape(q)}&ue=utf8"
      page = Nokogiri::HTML(open(path))

      basic_area = page.at("#results #eTransform ul li")
      basic_area && basic = basic_area.text.gsub(/\n\s+/, " ")
      p basic

      web_trans = []
      web_trans_area = page.css("#results #tWebTrans #webPhrase .wordGroup")
      web_trans_area && web_trans_area.each do |wt|
        web_trans << wt.text.gsub(/\n\s+/, " ")
      end
      p web_trans

      power_trans = []
      power_trans_area = page.css("#results #tPowerTrans ul.ol li")
      power_trans_area && power_trans_area.each do |pt|
        power_trans << pt.text.gsub(/\n\s+/, " ")
      end
      p power_trans

      bilinguals = []
      bilinguals_area = page.css("#results #examples #bilingual ul.ol li p")
      bilinguals_area && bilinguals_area.each do |b|
        bilinguals << b.text.gsub(/\n\s+/, " ")
      end
      p bilinguals

      original_sounds = []
      original_sounds_area = page.css("#results #examples #originalSound ul.ol li p")
      original_sounds_area && original_sounds_area.each do |os|
        original_sounds << os.text.gsub(/\n\s+/, " ")
      end
      p original_sounds

      baike_area = page.at_css("#results #eBaike .content")
      baike_area && (baike = baike_area.text.gsub(/\n\s+/, " "))
      p baike
=end
    end
  end
end
