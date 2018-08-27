require 'pry'
require 'capybara/poltergeist'

class SfSymphonyConcerts::Scraper

  def self.get_page(url)
    #doc = Nokogiri::HTML(open(url))
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
      concert.conductor = scrape_concert(concert.url)[0]
      concert.program = scrape_concert(concert.url)[1]
      concert.description = scrape_concert(concert.url)[2]
      concerts << concert
    end
    concerts
  end

  def self.scrape_concert(url)

    event = self.get_page_concert(url).css(".event-main-col")

    conductor_performers = event.css(".artist-credit-container").text
    program = event.css(".work-credit-container").text
    description = event.css(".event-details").text

    # concert.conductor = conductor_performers
    # concert.program = program
    # concert.description = description

    [conductor_performers, program, description]

  end

end
