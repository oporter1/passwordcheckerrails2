class PasswordController < ApplicationController
  def check

    if params.has_key?(:user_name) && !params[:user_name].strip.empty? && params.has_key?(:password) && !params[:password].strip.empty?
      #place the requirements here
      @username= params[:user_name]
      @password_id= params[:password]
      flash.now[:user_name]=nil
      flash.now[:password]=nil
      #place the requirements here
      if @password_id.include?("$") || @password_id.include?("!") || @password_id.include?("#") || @password_id.include?("password")
        flash.now[:alert]="Your password is correct!"
      else
        flash.now[:notice]="Wrong, password must include !, #, $."
      end

      if @username.include?("!") || @username.include?("$") || @username.include?("#")
        flash.now[:yellow]="Wrong, username cannot include !, #, $."
      else
        flash.now[:bananas]="Correct user name!"
      end
      
      if @password_id.match(/\d/)
        flash.now[:chicken]="Correct, your password contains a number!"
      else
        flash.now[:duck]="You suck, you did not enter in a number in your password."
      end


    end



 end
end

#
# User ID and password cannot be the same
# User ID and password have to be at least six characters long
# User ID cannot contain the following characters: !#$
# Password has to contain at least one of: !#$
# Password cannot be "password"

# Stretch goal:
#
# Password has to contain at least one digit
# Super stretch goal:
#
# Password has to contain a lower and an uppercase letter (hint: use toUpperCase or toLowerCase)
