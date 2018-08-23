class SfSymphonyConcerts::Concert

  attr_accessor :title, :date, :description, :conductor, :performers, :program, :url

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
        puts " "
        puts "Description: #{@concerts[input.to_i - 1].description}"
        puts "Conductor: #{@concerts[input.to_i - 1].conductor}"
        puts "Performers: #{@concerts[input.to_i - 1].performers}"
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
