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
      concert.date = c.find(".calendar-events-dates").text
      concert.url = c.find_link("Learn More")[:href]
      puts concert.url
      concert.conductor = scrape_concert(concert.url)[0]
      concert.program = scrape_concert(concert.url)[1]
      concert.description = scrape_concert(concert.url)[2]
      concert.performers = scrape_concert(concert.url)[3]
      concerts << concert
    end
    concerts
  end

  def self.scrape_concert(url)

    conductor = "MTT"
    program = "A great program"
    description = "Awesome description"
    performers = "Yo Yo Ma"

    [conductor, program, description, performers]

  end

end
