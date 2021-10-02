require 'rails_helper'

describe ProfileDecorator do
  let(:user) { create(:user) }
  let(:decorator) { user.profile.decorate }

  describe '#pluralize_characters' do
    context 'with 0 characters' do
      it 'returns "Characters"' do
        expect(decorator.pluralize_characters).to eq('Characters')
      end
    end

    context 'with 1 character' do
      it 'returns "Character"' do
        create(:character, user: user)
        expect(decorator.pluralize_characters).to eq('Character')
      end
    end

    context 'with 2+ characters' do
      it 'returns "Characters"' do
        create_list(:character, 2, user: user)
        expect(decorator.pluralize_characters).to eq('Characters')
      end
    end
  end

  describe '#display_avatar' do
    context 'with avatar_URL' do
      let!(:avatar) { user.profile.avatar_URL = Faker::LoremFlickr.image(size: '50x60') }

      it 'returns the avatar_URL' do
        expect(decorator.display_avatar).to eq(avatar)
      end
    end

    context 'with no avatar_URL' do
      it 'returns bear avatar API' do
        expect(decorator.display_avatar).to include('https://avatars.dicebear.com/api/pixel-art-neutral/')
      end
    end

    context 'with script tag' do
      it 'removes the script tag' do
        user.profile.avatar_URL = 'https://i.redd.it/pvjdif3371y41.png<script>alert(1)</script>'
        expect(decorator.display_avatar).not_to include('<script>')
      end
    end
  end

  describe '#display_location_with_icon' do
    context 'with location' do
      let!(:location) { user.profile.location = 'Dungeons' }

      it 'returns an icon' do
        expect(decorator.display_location_with_icon).to include('<i class')
      end

      it 'returns location' do
        expect(decorator.display_location_with_icon).to include(location)
      end
    end

    context 'with no location' do
      it 'returns nil' do
        expect(decorator.display_location_with_icon).to eq(nil)
      end
    end

    context 'with script tag' do
      it 'removes the script tag' do
        user.profile.location = 'Zimbabwe<script>alert(1)</script>'
        expect(decorator.display_location_with_icon).not_to include('<script>')
      end
    end
  end

  describe '#display_about_me' do
    context 'with about_me' do
      it 'returns about_me' do
        user.profile.about_me = 'Hey'
        expect(decorator.display_about_me).to eq(user.profile.about_me)
      end
    end

    context 'with no about_me' do
      it 'returns "No information available"' do
        expect(decorator.display_about_me).to have_content('No information')
      end
    end
  end

  describe '#display_twitter_paragraph' do
    context 'with twitter_username' do
      let!(:username) { user.profile.twitter_username = 'heroku_user1' }

      it 'returns an icon' do
        expect(decorator.display_twitter_paragraph).to include('<i class')
      end

      it 'returns an anchor tag' do
        expect(decorator.display_twitter_paragraph).to include("<a href=\"http://www.twitter.com/#{username}")
      end

      it 'returns username' do
        expect(decorator.display_twitter_paragraph).to include("#{username}</a></p>")
      end
    end

    context 'with no twitter_username' do
      it 'returns nil' do
        expect(decorator.display_twitter_paragraph).to eq(nil)
      end
    end

    context 'with script tag' do
      it 'removes the script tag' do
        user.profile.twitter_username = 'alan04<script>alert(1)</script>'
        expect(decorator.display_twitter_paragraph).not_to include('<script>')
      end
    end
  end

  describe '#display_instagram_paragraph' do
    context 'with instagram_username' do
      let!(:username) { user.profile.instagram_username = 'BillieE' }

      it 'returns an icon' do
        expect(decorator.display_instagram_paragraph).to include('<i class')
      end

      it 'returns an anchor tag' do
        expect(decorator.display_instagram_paragraph).to include("<a href=\"http://www.instagram.com/#{username}")
      end

      it 'returns username' do
        expect(decorator.display_instagram_paragraph).to include("#{username}</a></p>")
      end
    end

    context 'with no instagram_username' do
      it 'returns nil' do
        expect(decorator.display_instagram_paragraph).to eq(nil)
      end
    end

    context 'with script tag' do
      it 'removes the script tag' do
        user.profile.instagram_username = 'alan04<script>alert(1)</script>'
        expect(decorator.display_instagram_paragraph).not_to include('<script>')
      end
    end
  end

  describe '#display_discord_paragraph' do
    context 'with discord_username' do
      let!(:username) { user.profile.discord_username = 'Dungeons#1234' }

      it 'returns an icon' do
        expect(decorator.display_discord_paragraph).to include('<i class')
      end

      it 'returns username' do
        expect(decorator.display_discord_paragraph).to include(username)
      end
    end

    context 'with no discord_username' do
      it 'returns nil' do
        expect(decorator.display_location_with_icon).to eq(nil)
      end
    end

    context 'with script tag' do
      it 'removes the script tag' do
        user.profile.discord_username = 'alan04<script>alert(1)</script>'
        expect(decorator.display_discord_paragraph).not_to include('<script>')
      end
    end
  end
end
