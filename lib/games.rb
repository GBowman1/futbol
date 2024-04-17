require 'csv'

class Games
    @@all_games = []
    
    attr_reader :game_id,
                :season,
                :type,
                :date_time,
                :away_team_id,
                :home_team_id,
                :away_goals,
                :home_goals

    def initialize(csv_file_path)
        @game_id = csv_file_path['game_id']
        @season = csv_file_path['season']
        @type = csv_file_path['type']
        @date_time = csv_file_path['date_time']
        @away_team_id = csv_file_path['away_team_id']
        @home_team_id = csv_file_path['home_team_id']
        @away_goals = csv_file_path['away_goals']
        @home_goals = csv_file_path['home_goals']
        @@all_games << self
    end

    def self.all_games
        @@all_games
    end

    # def self.generate_games
    #     CSV.foreach("./data/games.csv", headers: true, header_converters: :symbol ) do |row|
    #         Games.new(row)
    #     end
    # end
end