module API
  module Public
    module V1
      class Me < API::Public::V1::Root
        include API::Defaults
        resource :me, desc: 'Operations about the current user' do
          desc 'Get information about the current user' do
            detail 'Current user is the owner of the `access_token` you use in the request.'
          end
          oauth2 # This endpoint requires authentication
          get '/' do
            {
              id: current_user.id.to_s,
              user: {
                email: current_user.email
              }
            }
          end

          desc 'Update user, Protected, only accessible with write user'
          params do
            optional :email, type: String, desc: 'User email'
            # Demo of value list, displays as select in swagger-ui
            optional :demo_value, type: String, values: ['value 1', 'value 2', '3'], default: 'value 1', desc: 'Special value list'
          end
          oauth2 'write_user'
          put '/' do
            declared_p = declared(params, include_missing: false)
            demo_value = declared_p.delete(:demo_value)

            current_user.update_attributes(declared_p)
            {
              id: current_user.id.to_s,
              user: {
                value: demo_value,
                email: current_user.email
              }
            }
          end
        end
      end
    end
  end
end
