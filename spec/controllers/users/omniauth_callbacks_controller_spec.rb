# frozen_string_literal: true

# # frozen_string_literal: true
#
# describe Users::OmniauthCallbacksController do
#   describe '#facebook' do
#     let(:oauth_params) do
#       { 'omniauth.auth' =>
#            { 'provider' => 'facebook',
#              'uid' => '1234',
#              'extra' => {
#                'user_hash' => { 'email' => 'ghost@nobody.com' }
#              } } }
#     end
#
#     before do
#       controller.request.env['omniauth.auth'] = oauth_params
#     end
#
#     it 'sends oauth request' do
#       expect(User).to receive(:from_omniauth).with(oauth_params)
#
#       get :facebook
#     end
#
#     context 'when user is persisted' do
#       let(:user) { double(User, id: 1, persisted?: true) }
#
#       before do
#         allow(User).to receive(:from_omniauth).and_return(user)
#       end
#
#       # redirects to bla bla...
#     end
#
#     context 'when user is not persisted' do
#       let(:user) { double(User, id: 1, persisted?: false) }
#
#       before do
#         allow(User).to receive(:from_omniauth).and_return(user)
#       end
#
#       # redirects to bla bla...
#     end
#   end
# end
