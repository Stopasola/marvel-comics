require "rails_helper"

describe Comic do
  let(:user) { create(:user) }
  let(:comic) { create(:comic) }
  let(:comic_with_image) { create(:comic, thumbnail: { 'path' => 'logo', 'extension' => 'jpg' }) }

  describe 'upvoted' do
    it 'returns true if the current user has upvoted a certain comic' do

      upvote = create(:upvote, user_id: user.id, comic_id: comic.id)

      comic.upvote = upvote

      expect(comic.upvoted?).to be_truthy
    end
  end

  describe '#humb_path' do
    it "concatenates the thumbnail's filepath and its extension " do
      expect(comic_with_image.thumb_path).to eq('logo.jpg')
    end
  end
end

