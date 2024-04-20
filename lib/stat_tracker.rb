require 'csv'
require 'pry'

class StatTracker

    attr_reader :teams,
                :games,
                :game_teams

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
        csv_objects = []
        CSV.foreach(data, headers: true) do |row|
            if data == './data/test_games.csv' || data == './data/games.csv'
                csv_objects << Games.new(row)
            elsif data == './data/teams.csv'
                csv_objects << Teams.new(row)
            elsif data == './data/test_game_teams.csv' || data == './data/game_teams.csv'
                csv_objects << GameTeams.new(row)
            end
        end
        csv_objects
    end
    # def self.from_csv(data)
    #     games = generate_csv_data(data[:games], Games)
    #     teams = generate_csv_data(data[:teams], Teams)
    #     game_teams = generate_csv_data(data[:game_teams], GameTeams)

    #     StatTracker.new(teams, games, game_teams)
    # end
    
    # def self.generate_csv_data(data, klass)
    #     csv_objects = []
    #     CSV.foreach(data, headers: true) do |row|
    #         csv_objects << klass.new(row)
    #     end
    #     csv_objects
    # end

    def highest_total_score
        @games.map do |game|
            game.away_goals.to_i + game.home_goals.to_i
        end.max
    end

    def lowest_total_score
        @games.map do |game|
            game.away_goals.to_i + game.home_goals.to_i
        end.min
    end
    def percentage_home_wins 
        home_win_count = 0
        game_count = @game_teams.count.to_f / 2
        @game_teams.each do |game_teams|
            # binding.pry
            if game_teams.hoa == 'home' && game_teams.result == 'WIN'
                home_win_count += 1
            end
        end
        # require 'pry'; binding.pry
        return 0 if home_win_count == 0
        (home_win_count.to_f / game_count).round(2) 
    end
    def percentage_visitor_wins 
        away_win_count = 0
        game_count = @game_teams.count.to_f / 2
        @game_teams.each do |game_teams|

            if game_teams.hoa == 'away' && game_teams.result == 'WIN'
                away_win_count += 1
            end
        end

        return 0 if away_win_count == 0
        (away_win_count.to_f / game_count).round(2) 
    end

    def percentage_ties
        tie_count = 0
        game_count = @game_teams.count.to_f / 2
        @game_teams.each do |game_teams|

            if game_teams.hoa == 'away' && game_teams.result == 'TIE'
                tie_count += 1
            end
        end
        
        return 0 if tie_count == 0
        (tie_count.to_f / game_count).round(2)
    end
    
    def count_of_games_by_season
        hash = Hash.new(0)
        @games.each do |game|
            hash[game.season] += 1
        end
        hash
    end

    def average_goals_per_game
        total_games = @games.count
        total_goals = 0 
        @games.each do |game|
            game_total = game.away_goals.to_i + game.home_goals.to_i
            total_goals += game_total
        end
        return 0 if total_games == 0
        (total_goals.to_f / total_games.to_f).round(2)
    end

    def average_goals_by_season
        season_hash = Hash.new(0)
        @games.each do |game|
            season_hash[game.season] += game.away_goals.to_i + game.home_goals.to_i
        end

        season_hash.each do |season, goals|
            # season_hash[season] = (goals.to_f / @games.count.to_f).round(2)
            season_hash[season] = (goals.to_f / count_of_games_by_season[season]).round(2)
        end
        season_hash
    end

    def team_count
        all_teams = teams.count
    end

    #Get average of all goals scored by team for all teams
    def best_offense
        team_avg_goals = Hash.new{|hash, key| hash[key] = {total_goals: 0, games: 0}}
        @game_teams.each do |game_team|
            team_avg_goals[game_team.team_id][:total_goals] += game_team.goals.to_i
            team_avg_goals[game_team.team_id][:games] += 1

        end
        best_team_id = team_avg_goals.max_by do |team_id, data|
            (data[:total_goals].to_f / data[:games]).round(2)
        end
        find_team_name(best_team_id[0])
    end

    def worst_offense
        team_avg_goals = Hash.new{|hash, key| hash[key] = {total_goals: 0, games: 0}}
        @game_teams.each do |game_team|
            team_avg_goals[game_team.team_id][:total_goals] += game_team.goals.to_i
            team_avg_goals[game_team.team_id][:games] += 1
        end
        worst_team_id = team_avg_goals.min_by do |team_id, data|
            (data[:total_goals].to_f / data[:games]).round(2)
        end
        find_team_name(worst_team_id[0])
    end

    def find_team_name(team_id)
        @teams.find do |team|
            team.team_id == team_id
        end.team_name
    end

    def highest_scoring_visitor
        team_avg_goals_away = Hash.new{|hash, key| hash[key] = {total_goals: 0, games: 0}}
        @game_teams.each do |game_team|
            if game_team.hoa == "away"
                team_avg_goals_away[game_team.team_id][:total_goals] += game_team.goals.to_i
                team_avg_goals_away[game_team.team_id][:games] += 1
                end
            end
            best_team_id = team_avg_goals_away.max_by do |team_id, data|
                (data[:total_goals].to_f / data[:games]).round(2)
        end
        find_team_name(best_team_id[0])
    end
    def highest_scoring_home_team
        team_avg_goals_home = Hash.new{|hash, key| hash[key] = {total_goals: 0, games: 0}}
        @game_teams.each do |game_team|
            if game_team.hoa == "home"
                team_avg_goals_home[game_team.team_id][:total_goals] += game_team.goals.to_i
                team_avg_goals_home[game_team.team_id][:games] += 1
            end
        end
        best_team_id = team_avg_goals_home.max_by do |team_id, data|
            (data[:total_goals].to_f / data[:games]).round(2)
        end
        find_team_name(best_team_id[0])
    end
    def lowest_scoring_visitor
        team_avg_goals_away = Hash.new{|hash, key| hash[key] = {total_goals: 0, games: 0}}
        @game_teams.each do |game_team|
            if game_team.hoa == "away"
                team_avg_goals_away[game_team.team_id][:total_goals] += game_team.goals.to_i
                team_avg_goals_away[game_team.team_id][:games] += 1
                end
            end
            worst_team_id = team_avg_goals_away.min_by do |team_id, data|
                (data[:total_goals].to_f / data[:games]).round(2)
        end
        find_team_name(worst_team_id[0])
    end
    
    def lowest_scoring_home_team
        team_avg_goals_home = Hash.new{|hash, key| hash[key] = {total_goals: 0, games: 0}}
        @game_teams.each do |game_team|
            if game_team.hoa == "home"
                team_avg_goals_home[game_team.team_id][:total_goals] += game_team.goals.to_i
                team_avg_goals_home[game_team.team_id][:games] += 1
                end
            end
            worst_team_id = team_avg_goals_home.min_by do |team_id, data|
                (data[:total_goals].to_f / data[:games]).round(2)
        end
        find_team_name(worst_team_id[0])
    end
end