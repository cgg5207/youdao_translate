# encoding: UTF-8
module YoudaoTranslate
  class YoudaoWord
    include Command
    ATTRIBUTES = { "Standard" => 0, "Bold" => 1, "Reverse" => 2 }
    COLORS = { "Black" => 30, "Red" => 31, "Green" => 32, "Yellow" => 33, "Blue" => 34, "Magenta" => 35, "Cyan" => 36, "White" => 37 }
    attr_reader :page

    def self.search(q, options)
      path = "http://dict.youdao.com/search?le=#{options["language"]}&q=#{CGI.escape(q)}&ue=utf8"
      original_page = Nokogiri::HTML(open(path))
      original_page.css("p.via", "p.example-via").each { |element| element.remove }

      instance = new
      instance.instance_variable_set("@page", original_page)

      options.delete("language")
      options.each do |key, value|
        value && instance.send(("get_" + key.to_s).to_sym)
      end
    end

    def set_color(header, text, color, bold = false)
      text = text.is_a?(Array) ? text.each { |t| t.gsub!(/\n\s+/, " ") }.join("\n") : text.gsub!(/\n\s+/, " ")

      bold = bold ? ATTRIBUTES["Bold"] : ATTRIBUTES["Standard"]
      color = COLORS[color.to_s.capitalize] || COLORS["Green"]
      "\033[#{bold};#{color}m#{header}#{text}\033[0m"
    end

    def get_basic
      announce_area = page.at("#results .trans-wrapper h2")
      announce_area && announce = announce_area.text
      STDOUT.puts set_color("", announce, "Red") if announce

      basic_text = []
      basic_area = page.css("#results #eTransform #etcTrans ul li")
      basic_area && basic_area.each do |ba|
        basic_text << ba.text
      end
      STDOUT.puts set_color("基本释义:\n", basic_text, "Blue")
    end

    def get_phrases
      phrases = []
      phrase_area = page.css("#results #eTransform #wordGroup.trans-container p.wordGroup")
      phrase_area && phrase_area.each do |pa|
        phrases << pa.text
      end
      STDOUT.puts set_color("词组短语:\n", phrases, "Yellow")
    end

    def get_synonyms
      synonyms = []
      path = "#results #eTransform #synonyms.trans-container ul"
      synonyms_area = page.css(path + " li", path + " .wordGroup")
      synonyms_area && synonyms_area.each do |sa|
        synonyms << sa.text
      end
      STDOUT.puts set_color("近义词:\n", synonyms, "Yellow")
    end

    def get_web
      web_trans = []
      web_trans_area = page.css("#results #tWebTrans #webPhrase p.wordGroup")
      web_trans_area && web_trans_area.each do |wt|
        web_trans << wt.text
      end
      STDOUT.puts set_color("网络释义:\n", web_trans, "Yellow")
    end

    def get_powertrans
      power_trans = []
      power_trans_area = page.css("#results #tPowerTrans ul li span.def")
      power_trans_area && power_trans_area.each do |pt|
        power_trans << pt.text
      end
      STDOUT.puts set_color("21世纪大英汉词典:\n", power_trans, "Blue")
    end

    def get_eetrans
      eetrans_trans = []
      eetrans_trans_area = page.css("#results #tEETrans ul li span.def")
      eetrans_trans_area && eetrans_trans_area.each do |et|
        eetrans_trans << et.text
      end
      STDOUT.puts set_color("英英释义:\n", eetrans_trans, "Yellow")
    end

    def get_bilinguals
      bilinguals = []
      bilinguals_area = page.css("#results #examples #bilingual ul li p")
      bilinguals_area && bilinguals_area.each do |b|
        bilinguals << b.text
      end
      STDOUT.puts set_color("双语例句:\n", bilinguals, "Blue")
    end

    def get_original_sounds
      original_sounds = []
      original_sounds_area = page.css("#results #examples #originalSound ul li p")
      original_sounds_area && original_sounds_area.each do |os|
        original_sounds << os.text
      end
      STDOUT.puts set_color("原声例句:\n", original_sounds, "Yellow")
    end

    def get_authority_trans
      authority_trans = []
      authority_trans_area = page.css("#results #examples #authority ul li p:nth-child(odd)")
      authority_trans_area && authority_trans_area.each do |at|
        authority_trans << at.text
      end
      STDOUT.puts set_color("权威例句:\n", authority_trans, "Blue")
    end

    def get_baike
      baike_text = []
      baike_area = page.css("#results #eBaike .content p")
      baike_area && baike_area.each do |ba|
        baike_text << ba.text
      end
      STDOUT.puts set_color("百科:\n", baike_text, "Green")
    end
  end
end