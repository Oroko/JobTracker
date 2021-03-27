  class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def github
       @user = User.from_omniauth(request.env["omniauth.auth"])
       byebug
       if @user.id? && @user.persisted?
         sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
         set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
       elsif @user.id?
        
        flash[:notice] = 'Email is already in use'
        byebug
        redirect_to new_user_session_url

       else
         @existing_user = User.find_by(email: @user.email)
         session["devise.github_data"] = request.env["omniauth.auth"].except('extra')
         flash[:notice] = "Email is already in use with #{@existing_user.provider}"
         redirect_to new_user_registration_url
       end
    end    

    def facebook
       @user = User.from_omniauth(request.env["omniauth.auth"])
       byebug
       if @user.id && @user.persisted?
         sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
         set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?

       elsif @user.id?
        
        flash[:notice] = 'Email is already in use'
        byebug
        redirect_to new_user_session_url

       else
         session["devise.facebook_data"] = request.env["omniauth.auth"].except('extra')
         redirect_to new_user_registration_url
       end
    end    

    def google_oauth2
       @user = User.from_omniauth(request.env["omniauth.auth"])

        byebug
       if @user.id && @user.persisted?
         sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
         set_flash_message(:notice, :success, kind: "Google") if is_navigational_format? 

       elsif @user.id?
        
        flash[:notice] = 'Email is already in use'
        byebug
        redirect_to new_user_session_url

       else
         session["devise.google_data"] = request.env["omniauth.auth"].except('extra')
         redirect_to new_user_registration_url
       end
    end  
  end
  
  
  
  
  
    