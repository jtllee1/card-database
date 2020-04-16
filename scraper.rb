require 'open-uri'
require 'nokogiri'

puts "Running scraper"

# url = "https://yugioh.fandom.com/wiki/Legend_of_Blue_Eyes_White_Dragon"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# @cards = html_doc.at('#Top_table').search('a')

# @cards.each do |card|
#   puts card.text
# end

@urls = ["https://yugioh.fandom.com/wiki/Tri-Horned_Dragon", "https://yugioh.fandom.com/wiki/Hane-Hane", "https://yugioh.fandom.com/wiki/Exodia_the_Forbidden_One", "https://yugioh.fandom.com/wiki/Gaia_the_Dragon_Champion", "https://yugioh.fandom.com/wiki/Polymerization", "https://yugioh.fandom.com/wiki/Legendary_Sword", "https://yugioh.fandom.com/wiki/Forest", "https://yugioh.fandom.com/wiki/Two-Pronged_Attack", "https://yugioh.fandom.com/wiki/Dragon_Capture_Jar"]

@urls.each do |url|
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  @name = html_doc.at('.cardtablerowdata').text.strip

  puts @name

  @image = html_doc.at('.cardtable-cardimage a')['href']

  puts @image

  @data_search = []

  @data = html_doc.search('.cardtablerowdata a')

  @data.each do |data|
    @data_search << data.text
  end

  @data_search = @data_search.reject! {|x| x == "" || x == "Check translation"}

  @card = @data_search[0]

  puts @card

  if @data_search[0] == "Monster"
    puts @attribute = @data_search[1]
    puts @type = @data_search[2]
    if @data_search[3] == "Effect" || @data_search[3] == "Fusion"
      puts @category = @data_search[3]
      puts @level = @data_search[4]
      puts @atk = @data_search[5]
      puts @def = @data_search[6]
      if @data_search[3] == "Effect"

      elsif @data_search[3] == "Fusion"

      end
    else
      puts @monster_category = "Normal"
      puts @level = @data_search[3]
      puts @atk = @data_search[4]
      puts @def = @data_search[5]
    end
  elsif @data_search[0] == "Spell"
    puts @category = @data_search[1]
  elsif @data_search[0] == "Trap"
    puts @category = @data_search[1]
  end

  @description = html_doc.search('.cardtablespanrow').at('td.navbox-list').text.strip

  puts @description
end
