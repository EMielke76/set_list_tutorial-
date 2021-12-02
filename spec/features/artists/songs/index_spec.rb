# As a user
# When I visit an Artist's Songs Index
# Then I see the titles all of that Artist's Songs
# And I see that each title is a link ot the songs show page

require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 123, play_count:213)
    @beret = @prince.songs.create!(title: 'Rasberry Beret', length: 134, play_count:432)
  end

  it 'shows all of the titles of songs for the artist' do

    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 128.5")
  end
end
