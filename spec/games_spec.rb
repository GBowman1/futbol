require 'spec_helper'

RSpec.describe Games do
    before(:all) do
    
        @csv = {
            game_id: 2012030232,
            season: 20122013,
            type: "Postseason",
            date_time: "5/19/13",
            away_team_id: 3,
            home_team_id: 6,
            away_goals: 2,
            home_goals: 1
        }
    end

    it 'exists' do     
        games = Games.new(@csv)

        expect(games).to be_a(Games)
    end

    

end