require './spec/spec_helper.rb'

describe Teams do
    before(:each) do
        Teams.generate_teams
    end

    describe 'class methods' do
        it 'should have a method that generates teams' do
            expect(Teams.all_teams.length).to eq(32)
        end
    end

    describe 'initialize' do
        it 'should create a new instance of Teams' do
            expect(Teams.all_teams[0]).to be_an_instance_of(Teams)
        end
        it 'should have attributes' do
            expect(Teams.all_teams[0].team_id).to eq("1")
            expect(Teams.all_teams[0].franchise_id).to eq("23")
            expect(Teams.all_teams[0].team_name).to eq("Atlanta United")
            expect(Teams.all_teams[0].team_link).to eq("/api/v1/teams/1")
        end
    end
end