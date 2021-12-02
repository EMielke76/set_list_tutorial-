require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average song length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 123, play_count:213)
        @beret = @prince.songs.create!(title: 'Rasberry Beret', length: 134, play_count:432)
        @other_song = @prince.songs.create!(title: 'Brians Song', length: 2, play_count:432)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(86.33)
      end
    end
  end
end
