class SfSymphonyConcerts::Concert

  def self.this_month(year,month)
    url_string = "http://www.sfsymphony.org/Buy-Tickets/Calendar#mo=#{year}:#{month}"
    puts url_string
  end

end
