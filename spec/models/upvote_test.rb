require 'rails_helper'

describe Upvote do
  let(:user) { create(:user) }
  let(:comic) { create(:comic) }

  describe '.create' do
    context 'with a valid upvote' do
      it 'creates an upvote that maps a comic and a user' do
        upvote = create(:upvote, user: user.id, comic_id: comic.id)

        expect(upvote.comic_id).to eq(comic.id)
      end
    end

    context 'with an upvote without a user' do
      it 'raises an error' do
        expect do
          create(:upvote, user: nil, comic_id: comic.id)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'with an upvote without a comic' do
      it 'raises an error' do
        expect do
          create(:upvote, user: user.id,, comic_id: nil)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end