require 'pry'
require 'capybara/poltergeist'

class SfSymphonyConcerts::Scraper

  def self.get_page(url)
    session = Capybara::Session.new(:poltergeist)
    session.visit(url)
    session
  end

  def self.get_page_concert(url)
    doc = Nokogiri::HTML(open(url))
    doc
  end

  def self.scrape_concerts_index(url)
    self.get_page(url).all(".calendar-events-item")
  end


  def self.scrape_month(url)

    concerts = []
    scrape_concerts_index(url).each do |c|
      # binding.pry
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
      puts concert.url
      event = self.get_page_concert(url).css(".event-main-col")

      concert.artists = self.scrape_artists(event)
      concert.program = self.scrape_program(event)
      concert.description = self.scrape_description(event)

      concerts << concert
    end
    concerts
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
    program_cards = event.css(".work-credit program-item")
    program = []
    program_cards.each do |card|
      composer = card.children[1].text.strip
      song = card.children[3].text.strip
      performers << "#{composer} - #{song}"
    end
    program
    #event.css(".work-credit-container").text.strip
  end

  def self.scrape_description(event)
    event.css(".event-details").text.strip
  end



end
