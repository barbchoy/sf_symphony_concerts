class SfSymphonyConcerts::CLI


  def call
    puts "Hello World!"
    list_months
    list_the_month
    goodbye
  end

  def list_months

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
    17. ALL

    DOC


  end

  def list_the_month

    input = nil
    while input != "exit"
      puts "Select the month for the season of 2018-19 , type 17 for all, list or exit: "
      input = gets.strip.downcase
      if input.to_i >= 1 && input.to_i <= 7
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, input.to_i + 5)
      elsif input.to_i >= 8 && input.to_i <= 16
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, input.to_i - 7)
      elsif input.to_i == 17
        @concerts = SfSymphonyConcerts::Concert.this_month(3000, 100)
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


end
