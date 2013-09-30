songs = [
    "Phoenix - 1901",
    "Tokyo Police Club - Wait Up",
    "Sufjan Stevens - Too Much",
    "The Naked and the Famous - Young Blood",
    "(Far From) Home - Tiga",
    "The Cults - Abducted",
    "The Phoenix - Consolation Prizes"
]

def list(songs)
  songs.each_with_index do |song, i|
      puts "#{i + 1}. #{song}"
    end
end

def input
  gets.downcase.strip
end

def play(songs)
  song_selection = input
  begin
    song_selection = Integer(song_selection)
  rescue
  end

  if song_selection.is_a?(Integer)
    puts "Playing #{songs[song_selection.to_i - 1]}..."
  else
    puts song_selection if songs.include?(song_selection)
  end
end

loop do
  puts "Please enter a command:"
  command = input
  case command
  when "play"
    puts "What song would you like to play? By # please."
    list(songs)
    play(songs)
  when "exit"
    puts "Goodbye!"
    exit
  when "list"
    list(songs)
  when "help"
    puts "I support help, play, exit and list"
  else
    puts "What are you talking about?"
  end
end