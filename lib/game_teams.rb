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

    def initialize(csv_file_path)
        @game_id = csv_file_path['game_id']
        @team_id = csv_file_path['team_id']
        @hoa = csv_file_path['HoA']
        @result = csv_file_path['result']
        @head_coach = csv_file_path['head_coach']
        @goals = csv_file_path['goals']
        @shots = csv_file_path['shots']
        @tackles = csv_file_path['tackles']
        @@game_box_score << self
    end

    def self.game_box_score
        @@game_box_score
    end

    # def self.generate_box_scores(game_teams_path)
    #     CSV.foreach(game_teams_path, headers: true, header_converters: :symbol) do |row|
    #         GameTeams.new(row)
    #     end
    # end
end