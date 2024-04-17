class StatTracker
    def initialize(locations)
        @games = Games.generate_games(locations[:game_path])
        @teams = Teams.generate_teams(locations[:team_path])
        @game_teams = GameTeams.generate_box_scores(locations[:game_teams_path])
    end

    def highest_total_score
        total_scores = []
        @games.all_games.each do |game|
            game_total = game.away_goals.to_i + game.home_goals.to_i
            total_scores << game_total
            
        end

        total_scores
    end
end

