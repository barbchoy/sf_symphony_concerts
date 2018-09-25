class SfSymphonyConcerts::Concert

  attr_accessor :title, :date, :description, :artists, :program, :url, :month

  @@all = []

  def initialize()
    @@all << self
  end

  def self.find_by_title(title)
    @@all.find do |concert|
      concert.title == title
    end
  end

  def self.find_by_url(url)
    @@all.find do |concert|
      concert.url == url
    end
  end

  def self.find_by_month(month)
    @@all.select { |concert| concert.month == month }
  end

  def self.all
    @@all
  end

  def self.this_month(value)
    url_string = "http://www.sfsymphony.org/Buy-Tickets/Calendar#mo=#{value}"
    SfSymphonyConcerts::Scraper.scrape_month(url_string, value)
  end

  def scrape_details(url_string)
    SfSymphonyConcerts::Scraper.scrape_details(url_string)
  end

end
