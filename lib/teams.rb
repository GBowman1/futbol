require 'csv'

class Teams
    @@all_teams = []

    attr_reader :team_id,
                :franchise_id,
                :team_name,
                :team_link

    def initialize(csv)
        @team_id = csv['team_id']
        @franchise_id = csv['franchiseId']
        @team_name = csv['teamName']
        @team_link = csv['link']
        @@all_teams << self
    end

    def self.all_teams
        @@all_teams
    end

    def self.generate_teams
        CSV.foreach('./data/teams.csv', headers: true) do |row|
            Teams.new(row)
        end
    end
end