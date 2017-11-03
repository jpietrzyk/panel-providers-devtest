
module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :ensure_user, raise: false

    def google
      @user = User
              .from_omniauth(
                request.env['omniauth.auth'].uid,
                request.env['omniauth.auth']
              )
      if @user.persisted?
        sign_in_and_redirect @user
        if is_navigational_format?
          set_flash_message(
            :notice,
            :success,
            kind: 'Google'
          )
        end
      else
        puts request.env['omniauth.auth']
        flash[:error] =
          'We\'re sorry, we failed to sign you in. Please contact admin'
        redirect_to root_url
      end
    end
  end
end
