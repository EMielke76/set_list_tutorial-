require 'rails_helper'

RSpec.describe 'the songs show page' do
  # As a visitor
  # When I visit /songs/1 (where 1 is the id of a song in my database)
  # Then I see that son's title, and artist
  # And I do not see any of the other songs in my data base
  it 'displays the song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really Like You", length: 208, play_count: 245)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 215, play_count: 450)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really Like You", length: 208, play_count: 245)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 215, play_count: 450)
    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
  end

  it 'displays the songs title, length, and playcount' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really Like You", length: 208, play_count: 245)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to have_content(song.length)
    expect(page).to have_content(song.play_count)
  end

  # When I visit a song show page
  # I see a link back to the songs index page
  # when I click this link
  # I am take to the songs index

  it 'displays a link back to the the songs index page' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really Like You", length: 208, play_count: 245)
    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_link("Back to Index", :href=>"/songs")
  end

end
