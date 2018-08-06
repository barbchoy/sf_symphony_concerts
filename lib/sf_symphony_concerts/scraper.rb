class SfSymphonyConcerts::Scraper

  def self.get_page(url)
    doc = Nokogiri::HTML(open(url))
  end

  def self.scrape_concerts_index(url)
    puts self.get_page(url).css("div.calendar-events")
    self.get_page(url).css("div.calendar-events")
  end


  def self.scrape_month(url)

    concerts = []
    scrape_concerts_index(url).each do |c|
      concert = SfSymphonyConcerts::Concert.new
      concert.title = c.css(div.calendar-events-item).css("div.calendar-events-title").text
      puts concert.title
      concert.date = c.css("calendar-events-dates").text
      concerts << concert
      puts concert
      puts " "
    end
    concerts

    # concert_1 = SfSymphonyConcerts::Concert.new
    # concert_1.title = "Open Rehearsal: Janowski Conducts Wagner’s Love Music"
    # concert_1.date = "Thursday, May 2"
    # concert_1.description = "Experience the passions of springtime in this romantic event at the symphony. The renowned conductor Marek Janowski conducts works by music’s master of sensuality, Richard Wagner. Hear Tannhäuser’s hedonistic adventure in the Venusberg followed by the enrapturing Liebestod from Tristan und Isolde. Plus, the “fierce and impressive” (San Francisco Classical Voice) James Ehnes turns up the bravado in Bruch’s rousing Violin Concerto No. 1."
    # concert_1.conductor = "Conductor: Marek Janowski"
    # concert_1.performers = "Violin: James Ehnes"
    # concert_1.program = "Mendelssohn:Ruy Blas Overture\nBruch:Violin Concerto No. 1\nWagner:Overture and Venusberg Music from Tannhäuser\nWagner:Prelude and Liebestod from Tristan und Isolde"
    #
    # concert_2 = SfSymphonyConcerts::Concert.new
    # concert_2.title = "Janowski Conducts Wagner’s Love Music"
    # concert_2.date = "Thursday, May 2 - Saturday, May 4"
    # concert_2.description = "Experience the passions of springtime in this romantic event at the symphony. The renowned conductor Marek Janowski conducts works by music’s master of sensuality, Richard Wagner. Hear Tannhäuser’s hedonistic adventure in the Venusberg followed by the enrapturing Liebestod from Tristan und Isolde. Plus, the “fierce and impressive” (San Francisco Classical Voice) James Ehnes turns up the bravado in Bruch’s rousing Violin Concerto No. 1."
    # concert_2.conductor = "Conductor: Marek Janowski"
    # concert_2.performers = "Performers:\nVolin: James Ehnes"
    # concert_2.program = "Mendelssohn:Ruy Blas Overture\nBruch:Violin Concerto No. 1\nWagner:Overture and Venusberg Music from Tannhäuser\nWagner:Prelude and Liebestod from Tristan und Isolde"
    #
    # concert_3 = SfSymphonyConcerts::Concert.new
    # concert_3.title = "MTT Conducts the Music of Debussy"
    # concert_3.date = "Thursday, May 9 - Saturday, May 11"
    # concert_3.description = "With one dreamy wisp of a piece, Debussy revolutionized music. Delicious and captivating, Prelude to The Afternoon of a Faun paved the way for colors and impressions never before expressed in sound. Luxuriate in the luminescent world of this and other iconic works, including the churning sea picture, La Mer. Also on the program, MTT welcomes one of today’s great musical visionaries, piano virtuoso Pierre-Laurent Aimard."
    # concert_3.conductor = "Conductor: Michael Tilson Thomas"
    # concert_3.performers = "Performers:\nPiano: Pierre-Laurent Aimard\nWomen of the San Francisco Symphony Chorus, Ragnar Bohlin, director\nSan Francisco Symphony"
    # concert_3.program = "Debussy: Prélude to The Afternoon of a Faun\nLigeti: Piano Concerto\nDebussy:Nocturnes\nDebussy:La Mer"
    #
    # concert_4 = SfSymphonyConcerts::Concert.new
    # concert_4.title = "MTT Conducts the Music of Beethoven"
    # concert_4.date = "Thursday, May 20 - Saturday, May 22"
    # concert_4.description = "With one dreamy wisp of a piece, Debussy revolutionized music. Delicious and captivating, Prelude to The Afternoon of a Faun paved the way for colors and impressions never before expressed in sound. Luxuriate in the luminescent world of this and other iconic works, including the churning sea picture, La Mer. Also on the program, MTT welcomes one of today’s great musical visionaries, piano virtuoso Pierre-Laurent Aimard."
    # concert_4.conductor = "Conductor: Michael Tilson Thomas"
    # concert_4.performers = "performers 3"
    # concert_4.program = "program 4"
    #
    # [concert_1, concert_2, concert_3, concert_4]

  end

  def scraper_concert
  end

end
