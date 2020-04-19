require 'open-uri'
require 'nokogiri'

puts "Destroying data"

BoosterPack.destroy_all
Card.destroy_all
BoosterSet.destroy_all

puts "Finished"

puts "Running scraper"

urls = ["https://yugioh.fandom.com/wiki/Legend_of_Blue_Eyes_White_Dragon",
"https://yugioh.fandom.com/wiki/Metal_Raiders",
"https://yugioh.fandom.com/wiki/Spell_Ruler",
"https://yugioh.fandom.com/wiki/Pharaoh%27s_Servant",
"https://yugioh.fandom.com/wiki/Labyrinth_of_Nightmare",
"https://yugioh.fandom.com/wiki/Legacy_of_Darkness",
"https://yugioh.fandom.com/wiki/Pharaonic_Guardian",
"https://yugioh.fandom.com/wiki/Magician%27s_Force",
"https://yugioh.fandom.com/wiki/Dark_Crisis",
"https://yugioh.fandom.com/wiki/Invasion_of_Chaos",
"https://yugioh.fandom.com/wiki/Ancient_Sanctuary"]

urls.each do |url|
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  @booster_set_name = html_doc.at('.page-header__title').text

  puts @booster_set_name

  @booster_set_image = html_doc.at('.image')['href']

  puts @booster_set_image

  @booster_set = BoosterSet.new(
    name: @booster_set_name,
    picture: @booster_set_image
    )
  @booster_set.save!

  @data = html_doc.at('.tabbertab').search('tr')

  @title_links = []
  @href_links = []

  @data.each do |data|
    @title = []
    @href = []
    data.search('a').each do |data|
      @title << data.attribute('title')
      @href << data.attribute('href')
    end
    @title_links << @title
    @href_links << @href
  end

  @card_numbers = []
  @card_rarities = []
  @card_urls = []

  @title_links.each do |link|
    @card_numbers << link[0]
    @card_rarities << link[2]
  end

  @href_links.each do |link|
    @card_urls << link[1]
  end

  @counter = 1

  loop do
    puts @card_number = @card_numbers[@counter]
    puts @card_rarity = @card_rarities[@counter]

    url_extension = @card_urls[@counter]

    url = "https://yugioh.fandom.com#{url_extension}"

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
        puts @category = "Normal"
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

    @card = Card.new(
      name: @name,
      picture: @image,
      card: @card,
      monster_attribute: @attribute,
      monster_type: @type,
      category: @category,
      level: @level,
      atk: @atk,
      def: @def,
      description: @description
      )
    @card.save!

    @booster_pack = BoosterPack.new(
      card_number: @card_number,
      card_rarity: @card_rarity,
      card_id: @card.id,
      booster_set_id: @booster_set.id
      )
    @booster_pack.save!

    @counter += 1

    if @counter == @card_numbers.length
      break
    end
  end
end

puts "Finished!"
