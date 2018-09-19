class SfSymphonyConcerts::Scraper


  def self.get_page(url)
    session = Capybara::Session.new(:poltergeist)
    session.visit(url)
    session
  end

  def self.get_page_nokogiri(url)
    doc = Nokogiri::HTML(open(url))
    doc
  end

  def self.scrape_minical_index
    buy_tickets_page = "http://www.sfsymphony.org/Buy-Tickets/Calendar"
    self.get_page_nokogiri(buy_tickets_page).css(".minical-hdr").children[3]
  end

  def self.scrape_concerts_index(url)
    self.get_page(url).all(".calendar-events-item")
  end

  def self.scrape_minical
    months_values = {}
    no_of_months = scrape_minical_index.css('option').count
    (1..no_of_months-1).each do |index|
      month = scrape_minical_index.css('option')[index].text
      value = scrape_minical_index.css('option')[index]['value']
      months_values[month] = value
    end
    months_values
  end

  def self.scrape_month(url)
    concerts = []
    scrape_concerts_index(url).each do |c|
      concert = SfSymphonyConcerts::Concert.new
      concert.title = c.find(".calendar-events-title").text
      concert.date = c.find(".calendar-events-dates").text
      url = ""
      if c.has_link?("Learn More")
        url = c.find_link("Learn More")[:href]
      elsif c.has_link?("Buy Tickets")
        url = c.find_link("Buy Tickets")[:href]
      end
      concert.url = url
      concert.artists = ""
      concert.program = ""
      concert.description = ""
      concerts << concert
    end
    concerts
  end

  def self.scrape_details(url)
    event = self.get_page_nokogiri(url).css(".event-main-col")
    artists = self.scrape_artists(event)
    program = self.scrape_program(event)
    description = self.scrape_description(event)
    [artists, program, description]
  end

  def self.scrape_artists(event)
    artist_cards = event.css(".artist-detail-item")
    performers = []
    artist_cards.each do |artist|
      name = artist.children[1].text.strip
      position = artist.children[3].text.strip
      performers << "#{name} - #{position}"
    end
    performers
  end

  def self.scrape_program(event)
    program_cards = event.css(".work-credit")
    program = []
    program_cards.each do |card|
      composer = card.children[1].text.strip if card.children[1]
      song = card.children[3].text.strip if card.children[3]
      program << "#{composer} - #{song}"
    end
    program
  end

  def self.scrape_description(event)
    event.css(".event-details").text.strip
  end

end
