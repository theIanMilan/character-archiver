require 'support/sign_in_user'

RSpec.shared_context 'when user has a new character' do
  include_context 'when user is logged in'
  let(:character) { create(:character, user: user) }
end
