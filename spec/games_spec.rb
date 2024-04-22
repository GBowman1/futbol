require 'spec_helper'

RSpec.describe Games do
    before(:all) do
        @csv = CSV.read('./data/test_games.csv', headers: true).first
    end

    it 'exists' do     
        games = Games.new(@csv)

        expect(games).to be_a(Games)
    end

    it 'should have attributes' do
        games = Games.new(@csv)

        expect(games.game_id).to eq("2012030221")
        expect(games.season).to eq("20122013")
        expect(games.away_team_id).to eq("3")
        expect(games.home_team_id).to eq("6")
        expect(games.away_goals).to eq("2")
        expect(games.home_goals).to eq("3")
        expect(games.type).to eq("Postseason")
        expect(games.date_time).to eq("5/16/13")

    end
end