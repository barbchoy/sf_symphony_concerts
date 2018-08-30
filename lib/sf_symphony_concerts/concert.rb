class SfSymphonyConcerts::Concert

  MONTH_STRINGS = {
    1 => "January",
    2 => "February",
    3 => "March",
    4 => "April",
    5 => "May",
    6 => "June",
    7 => "July",
    8 => "August",
    9 => "September",
    10 => "October",
    11 => "December"
  }


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

    month_string = MONTH_STRINGS[month] + " #{year}"
    @concerts = SfSymphonyConcerts::Scraper.scrape_month(url_string)

    display_concerts(month_string)
    ask_which_concert(month_string)
  end

  def self.display_concerts(month_string)
    puts month_string
    @concerts.each.with_index(1) do |concert, i|
      puts "#{i}. #{concert.title} - #{concert.date}"
    end
  end

  def self.ask_which_concert(month_string)
    puts "Select a concert or type back: "
    input = nil
    while input != "back" && input != "exit"
      input = gets.strip.downcase
      if input.to_i >= 1 && input.to_i <= @concerts.count

        puts "**************************************************"
        puts "Description: "
        puts "#{@concerts[input.to_i - 1].description}"
        puts ""
        puts "Conductor and Performers:"
        @concerts[input.to_i - 1].artists.each do |artist|
          puts artist
        end
        puts ""
        puts "Program: "
        @concerts[input.to_i - 1].program.each do |song|
          puts song
        end
        puts "**************************************************"
        puts ""

        display_concerts(month_string)
        puts "Select a concert or type back: "
      else
        puts "Not sure what you want, select a concert or type back."
        display_concerts(month_string)
      end
    end

  end

end
