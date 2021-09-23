RSpec.shared_context 'when user is logged in' do
  let(:user) { create(:user, username: 'commoner') }

  before do
    sign_in user
  end
end
