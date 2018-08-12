require 'pry'
require 'capybara/poltergeist'

class SfSymphonyConcerts::Scraper

  def self.get_page(url)
    #doc = Nokogiri::HTML(open(url))
    session = Capybara::Session.new(:poltergeist)
    session.visit(url)
    session
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
      puts concert.title
      concert.date = c.find(".calendar-events-dates").text
      concerts << concert
    end
    concerts
  end

  def scraper_concert
  end

end
