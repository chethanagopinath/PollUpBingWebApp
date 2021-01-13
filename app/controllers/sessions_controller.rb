class SessionsController < ApplicationController
class DoubleLoginError < ArgumentError ; end
class NotCurrentUserError < ArgumentError ; end
  
  skip_before_filter :can_proceed
  
  def new
     
  end
  
  def auth_hash
    @auth_hash ||=request.env['omniauth.auth']
  end 
  

  def create
    begin
      if session?
        puts "Session exists"
        if same_as_logged_in_user? auth_hash['info']
         raise DoubleLoginError,
           "You may not login if you are already logged in"
        else
         raise NotCurrentUserError,
            "Identity Violation - Access Denied"
        end
      else
        puts "Session does not exist"
        if Authorization.exists?(auth_hash)
          puts "Authorization exists"
          auth = Authorization.find_with_omniauth(auth_hash)
          p auth
          message = "Welcome back #{auth.user.username}!" +
              "You have logged in via #{auth.provider}."
          session["user_id"] = auth.user.id
          self.current_user = auth.user
          flash[:notice] = "#{message}"
          redirect_to dashboard_index_path and return
        else
          puts "Authorization does not exist"
          if User.exists?(auth_hash['info'])
            puts "User exists"
            user = User.find_with_omniauth(auth_hash['info'])
            auth = user.add_provider(auth_hash)
            p user
            p auth
            message = "You can now login using #{auth_hash["provider"].capitalize}"
            session["user_id"] = auth.user.id
            self.current_user = auth.user
            flash[:notice] = "#{message}"
            redirect_to dashboard_index_path and return
          else
            puts "Register"
            @user = User.create_with_omniauth(auth_hash['info'])
            #Check for BU id. Send to failure path if invalid
            auth = @user.authorizations.create_with_omniauth(auth_hash)
            p @user
            p auth
            message = "Welcome #{@user.username}! You have signed up via #{auth.provider}."
            session["user_id"] = auth.user.id
            p session["user_id"]
        
            self.current_user = auth.user
            p self.current_user
            flash[:notice] = "#{message}"
            redirect_to edit_user_path(@user) and return
          end
        end
        
      end
    rescue DoubleLoginError, NotCurrentUserError, Exception => exception
      puts "EXCEPTION IN CREATE"
      flash[:error] = "#{exception.class}: #{exception.message}"
      redirect_to auth_failure_path and return      
    end
  end    
    #auth_hash = request.env['omniauth.auth'] 
    #render :text => auth_hash.inspect
   
    # @authorizations = Authorization.find_by(provider: auth_hash["[provider"], uid: auth_hash["uid"])
    # puts "\n authorization\n"
    # p @authorization
    # puts '\n'
    # if @authorization
    #   render :text => "Welcome back #{@authorization.user.username}! You are logged in."
    # else
    #   puts "\nusername\n"
    #   p auth_hash["info"]["name"]
    #   user = User.create! :username => auth_hash["info"]["name"], 
    #   :email => auth_hash["info"]["email"]
    #   @authorization = 
    #     user.authorizations.create :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    #   p @authorization
    #   puts"\nuser\n"
    #   p user
    #   puts '\n'
    #   puts "\n user.authorization\n"
    #   p user.authorizations
    #   puts '\n'
    #   render :text => "Hi #{user.username}! You've signed up."
    #   #within rescue block, rescue exception as e and print it to deal with any other issues
      #rescue Exception => e 
        #puts e 
      #end -> should be the last block in the body of your method 
    #end
  
  
  def session?
     !!session[:user_id]
  end  
  
  def same_as_logged_in_user? info
    user = User.find(session[:user_id])
    user.username == info['name'] && user.email == info['email']
  end  

  
  def failure
    begin
    rescue Exception => exception
      flash[:error] = "#{exception.class}: #{exception.message}"
      redirect_to welcome_login_path
    end 
  end


  def destroy
    #render :text => "logged out."
    message = "#{self.current_user.username} has logged out"
    self.current_user = nil
    session.delete(:user_id)
    reset_session
    flash[:notice] = message
    redirect_to welcome_login_path
  end
  
  def cleanup
    reset_session
    flash[:warning] = "Session Reset"
    redirect_to welcome_login_path
  end  
 
end
