require './spec/spec_helper.rb'

Games.generate_games

puts Games.all_games[0].inspect

# GameTeams.generate_box_scores

# puts GameTeams.game_box_score[0].inspect

# Teams.generate_teams

# puts Teams.all_teams[0].inspect

