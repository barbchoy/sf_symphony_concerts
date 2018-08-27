class SfSymphonyConcerts::Concert

  attr_accessor :title, :date, :description, :conductor, :performers, :program, :url

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
    puts url_string

    @concerts = SfSymphonyConcerts::Scraper.scrape_month(url_string)

    display_concerts
    ask_which_concert
  end

  def self.display_concerts
    @concerts.each.with_index(1) do |concert, i|
      puts "#{i}. #{concert.title} - #{concert.date}"
    end
  end

  def self.ask_which_concert
    puts "Select a concert or type back: "
    input = nil
    while input != "back" && input != "exit"
      input = gets.strip.downcase
      if input.to_i >= 1 && input.to_i <= @concerts.count
        concert_url = @concerts[input.to_i - 1].url
        details = SfSymphonyConcerts::Scraper.scrape_concert(concert_url)
        @concerts[input.to_i - 1].description = details[0]
        @concerts[input.to_i - 1].conductor = details[1]
        @concerts[input.to_i - 1].program = details[2]
        puts " "
        puts "Description: #{@concerts[input.to_i - 1].description}"
        puts "Conductor: #{@concerts[input.to_i - 1].conductor}"
        puts "Program: #{@concerts[input.to_i - 1].program}"
        puts "**************************************************"

        display_concerts
        puts "Select a concert or type back: "
      else
        puts "Not sure what you want, select a concert or type back."
        display_concerts
      end
    end

  end

end
