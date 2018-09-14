class SfSymphonyConcerts::CLI

  attr_accessor :concerts

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
    11 => "November",
    12 => "December"
  }

  def initialize
    @concerts = []
    self.call
  end


  def call
    puts "**********************************************************************"
    puts "Welcome to the San Francisco Symphony. Below you will find information"
    puts "about the concerts in the upcoming season 2018-19."
    puts "**********************************************************************"

    menu
    goodbye
  end

  def list_months

    SfSymphonyConcerts::Scraper.scrape_minical

    puts <<-DOC.gsub /^\s*/,''

    Upcoming concerts in the following months:

    1. June 2018
    2. July 2018
    3. August 2018
    4. September 2018
    5. October 2018
    6. November 2018
    7. December 2018
    8. January 2019
    9. February 2019
    10. March 2019
    11. April 2019
    12. May 2019
    13. June 2019
    14. July 2019
    15. August 2019
    16. September 2019

    DOC

  end

  def menu

    input = nil
    while input != "exit"
      list_months
      puts "Select the month for the season of 2018-19 , list or exit: "
      input = gets.strip.downcase
      if input.to_i >= 1 && input.to_i <= 7
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, input.to_i + 5)
        month_string = MONTH_STRINGS[input.to_i + 5] + " 2018"
        if @concerts ==[]
          puts "There is no concert for the month. Please select another month."
        else
          display_concerts(month_string)
          ask_which_concert(month_string)
        end
      elsif input.to_i >= 8 && input.to_i <= 16
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, input.to_i - 7)
        month_string = MONTH_STRINGS[input.to_i - 7] + " 2019"
        if @concerts ==[]
          puts "There is no concert for the month. Please select another month."
        else
          display_concerts(month_string)
          ask_which_concert(month_string)
        end
      elsif input == "list"
        list_months
      else
        puts "Not sure what you want, type list or exit "
      end

    end

  end

  def goodbye
    puts ""
    puts <<-DOC.gsub /^\s*/, ''
    ******************************************
    "Music is the movement of sound to reach
    the soul for the education of its virtue."
    ******************************************
    from Plato.
    Thank you and see you soon.
    DOC
    puts ""
  end

  def display_concerts(month_string)
    puts month_string
    @concerts.each.with_index(1) do |concert, i|
      puts "#{i}. #{concert.title} - #{concert.date}"
    end
  end

  def ask_which_concert(month_string)
    puts "Select a concert or type back: "
    input = nil
    while input != "back" && input != "exit"
      input = gets.strip.downcase
      if input.to_i >= 1 && input.to_i <= @concerts.count

        concert = @concerts[input.to_i - 1]

        if concert.artists == ""
          concert.artists = concert.scrape_details(concert.url)[0]
          concert.program = concert.scrape_details(concert.url)[1]
          concert.description = concert.scrape_details(concert.url)[2]
        end

        puts "**************************************************"
        puts "Description: "
        puts "#{concert.description}"
        puts ""
        puts "Conductor and Performers:"
        concert.artists.each do |artist|
          puts artist
        end
        puts ""
        puts "Program: "
        concert.program.each do |song|
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
