class SfSymphonyConcerts::CLI

  MONTHS_VALUES = {
    one: '6',
    two: '7',
    three: '8',
    four: '9'
  }

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

      case input
      when "1"
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, 6)
      when "2"
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, 7)
      when "3"
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, 8)
      when "4"
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, 9)
      when "5"
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, 10)
      when "6"
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, 11)
      when "7"
        @concerts = SfSymphonyConcerts::Concert.this_month(2018, 12)
      when "8"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 1)
      when "9"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 2)
      when "10"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 3)
      when "11"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 4)
      when "12"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 5)
      when "13"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 6)
      when "14"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 7)
      when "15"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 8)
      when "16"
        @concerts = SfSymphonyConcerts::Concert.this_month(2019, 9)
      when "17"
        @concerts = SfSymphonyConcerts::Concert.this_month(3000, 100)
      when "list"
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
