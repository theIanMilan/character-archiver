require 'rails_helper'

RSpec.describe ProfilesController, type: :routing do
  describe 'routing' do
    let!(:user) { create(:user, username: 'Pikachu') }
    let(:profile) { create(:profile, user: user) }

    it 'routes to #show' do
      expect(get: "/profiles/#{user.username}").to route_to('profiles#show', username: user.username)
    end

    it 'routes to #edit' do
      expect(get: "/profiles/#{user.username}/edit").to route_to('profiles#edit', username: user.username)
    end

    it 'routes to #update via PUT' do
      expect(put: "/profiles/#{user.username}").to route_to('profiles#update', username: user.username)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "/profiles/#{user.username}").to route_to('profiles#update', username: user.username)
    end
  end
end
