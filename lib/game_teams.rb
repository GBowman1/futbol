require 'csv'

class GameTeams
    @@game_box_score = []

    attr_reader :game_id,
                :team_id,
                :hoa,
                :result,
                :head_coach,
                :goals,
                :shots,
                :tackles

    def initialize(csv)
        @game_id = csv[:game_id]
        @team_id = csv[:team_id]
        @hoa = csv[:hoa]
        @result = csv[:result]
        @head_coach = csv[:head_coach]
        @goals = csv[:goals]
        @shots = csv[:shots]
        @tackles = csv[:tackles]
        @@game_box_score << self
    end

    def self.game_box_score
        @@game_box_score
    end

    def self.generate_box_scores(game_teams_path)
        CSV.foreach(game_teams_path, headers: true, header_converters: :symbol) do |row|
            GameTeams.new(row)
        end
    end
end