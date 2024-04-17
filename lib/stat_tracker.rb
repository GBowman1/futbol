require 'csv'

class StatTracker
    
    def initialize(teams, games, game_teams)
        @teams = teams
        @games = games
        @game_teams = game_teams
    end
    
    def self.from_csv(data)
        games = generate_csv_data(data[:games])
        teams = generate_csv_data(data[:teams])
        game_teams = generate_csv_data(data[:game_teams])

        StatTracker.new(teams, games, game_teams)
    end

    def self.generate_csv_data(data)
        CSV.foreach(data, headers: true) do |row|
            if data == './data/games.csv'
                Games.new(row)
            elsif data == './data/teams.csv'
                Teams.new(row)
            elsif data == './data/game_teams.csv'
                GameTeams.new(row)
            end
        end
    end

    def highest_total_score
        @games.all_games.map do |game|
            game.away_goals + game.home_goals
        end.max
    end
end
