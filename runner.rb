require './spec/spec_helper.rb'

stat = StatTracker.from_csv({ games: './data/games.csv', teams: './data/teams.csv', game_teams: './data/game_teams.csv' })

puts stat.highest_total_score
puts stat.lowest_total_score
puts stat.fewest_tackles("20122013")
puts stat.most_tackles("20122013")
puts stat.winningest_coach("20122013")
puts stat.worst_coach("20122013")

