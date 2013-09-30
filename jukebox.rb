def help_me
  system("clear")
  puts "Check it out...this is how I work:"
  puts "Press 'help' to get some help. (But you already knew that.)"
  puts "Press 'play' to play a song."
  puts "Press 'list' to see what you can play."
  puts "Press 'exit' to quit."
  puts "Enter to continue..."
  input = gets.chomp
end

def gimme_songs(songs)
  system("clear")
  puts "You can listen to anything! (As long as it's here.)".center(60, "*")
  songs.each do |song|
    puts "#{songs.index(song) + 1}. #{song}"
  end
  puts "Enter to continue..."
  input = gets.chomp
end

def list_again(songs)
  songs.each do |song|
    puts "#{songs.index(song) + 1}. #{song}"
  end
end

def play_it(song)
  system("clear")
  puts "ROCKING OUT".center(60, "*")
  puts ""
  puts "You are listening to: #{song}"
  puts "Enter to continue..."
  input = gets.chomp
end

def play_something(songs)
  system("clear")
  list_again(songs)
  puts "What can I play for you?"
  puts "You can type either a song name or the number."
  input = gets.chomp
  songs.each_with_index do |song, index|
    if song.split(' - ')[1].downcase == input.downcase
      play_it(song)
      break
    elsif index + 1 == input.to_i
      play_it(song)
      break
    elsif song.split(' - ')[0].downcase == input.downcase
      artist_array = []
      songs.each do |track|
        artist_array << track.split(' - ')[0].downcase 
      end
      if artist_array.count(song.split(' - ')[0].downcase) == 1
        play_it(song)
        break
      else
        songs.each do |track|
          if track.split(' - ')[0].downcase == song.split(' - ')[0].downcase
            play_ambiguous(track, songs)
            break
          end
        end
      end
    end
  end
end

def play_ambiguous(track, songs)
  system("clear")
  artist = track.split(' - ')[0].downcase
  songs.each_with_index do |song, index|
    if song.split(' - ')[0].downcase == artist
      puts "#{index + 1}. #{song}"
    end
  end
  puts "Type the number of the song you want to hear"
  input = gets.chomp
  play_it(songs[input.to_i - 1])
end

def jukebox
  songs = [
    "Phoenix - 1901",
    "Tokyo Police Club - Wait Up",
    "Sufjan Stevens - Too Much",
    "The Naked and the Famous - Young Blood",
    "(Far From) Home - Tiga",
    "The Cults - Abducted",
    "Phoenix - Consolation Prizes"
  ]

  while true
    system("clear")
    puts "SUPER COOL JUKEBOX THINGY".center(60, "~")
    puts "What would you like to do?"
    puts "Hint: type 'help'"
    input = gets.chomp
    case input
    when 'help'
      help_me
    when 'play'
      play_something(songs)
    when 'list'
      gimme_songs(songs)
    when 'exit'
      break
    else
      say_what
    end
  end
end

jukebox