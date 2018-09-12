class SfSymphonyConcerts::Concert

  attr_accessor :title, :date, :description, :artists, :program, :url

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

  def self.all
    @@all
  end

  def self.this_month(year, month)
    url_string = "http://www.sfsymphony.org/Buy-Tickets/Calendar#mo=#{year}:#{month}"
    @concerts = SfSymphonyConcerts::Scraper.scrape_month(url_string)
  end

end
