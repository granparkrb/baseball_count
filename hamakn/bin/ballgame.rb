require_relative "../lib/ball_game"

ballgame = BallGame.new

puts "Starting ball game!"
puts "input: #{ARGV[0]}"
puts "output(OSB): #{ballgame.print_counts_by_stream(ARGV[0] || "")}"
