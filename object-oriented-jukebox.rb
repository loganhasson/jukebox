songs = [
    "Phoenix - 1901",
    "Tokyo Police Club - Wait Up",
    "Sufjan Stevens - Too Much",
    "The Naked and the Famous - Young Blood",
    "(Far From) Home - Tiga",
    "The Cults - Abducted",
    "Phoenix - Consolation Prizes"
]

class JukeBox

  attr_accessor :input, :songs

  def initialize(songs)
    @songs = songs
    @input = ''
  end

  def list_songs
    self.songs.each_with_index do |song, i|
      puts "#{i+1}. " + song
    end
  end

  def rock_out(song_to_play)
    if song_to_play.is_a?(String)
      puts song_to_play
    elsif song_to_play.is_a?(Array)
      puts "Sorry, you have to be more specific."
    else
      width = self.songs[song_to_play].length
      puts ""
      puts "You are listening to:"
      puts ""
      print "  "
      puts "*" * width
      print "~ "
      print self.songs[song_to_play]
      puts " ~"
      print "  "
      puts "*" * width
      puts ""
      puts "Not judging, but I probably would have picked a different song."
    end
  end

  def understand(song_to_play)
    potentials = self.songs.map do |song|
      song if song.downcase.include?(song_to_play)
    end.compact

    if potentials.size == 0
      "Sorry, I don't know what song you mean."
    elsif potentials.size > 1
      potentials
    else
      songs.index(potentials[0])
    end
  end

  def play
    system('clear')
    self.list_songs
    puts ""
    print "What do you want to hear? Type a number, an artist, or a song name: "
    song_to_play = gets.downcase.strip
    if song_to_play.to_i.to_s == song_to_play
      self.rock_out(song_to_play.to_i - 1)
    else
      self.rock_out(self.understand(song_to_play))
    end
    puts ""
  end

  def say_what
    system('clear')
    puts "You confused me, man. Try again bonehead."
    puts ""
  end

  def help
    system('clear')
    puts "You can really only do a couple of things, kid:"
    puts "'play' to get a list of songs to play"
    puts "'help' to get help (but you already knew that)"
    puts "'exit' to get the heck outta here"
    puts ""
  end

  def do_stuff(input)
    case input
    when 'play'
      self.play
    when 'help'
      self.help
    when 'exit'
      puts "Ciao!"
    else
      self.say_what
    end
  end

  def call
    system('clear')
    while self.input != 'exit'
      print "Enter a command, brosef. When in doubt, type 'help': "
      self.input = gets.downcase.strip
      self.do_stuff(self.input)
    end
  end
end

j = JukeBox.new(songs)
j.call