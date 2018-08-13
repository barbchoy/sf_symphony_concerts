class SfSymphonyConcerts::Concert

  attr_accessor :title, :date, :description, :conductor, :performers, :program, :url

  def self.this_month(year, month)
    url_string = "http://www.sfsymphony.org/Buy-Tickets/Calendar#mo=#{year}:#{month}"
    puts url_string

    @concerts = SfSymphonyConcerts::Scraper.scrape_month(url_string)

    @concerts.each.with_index(1) do |concert, i|
      puts "#{i}. #{concert.title} - #{concert.date}"
    end

  end

end
