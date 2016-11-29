class UserController < ApplicationController

  def profile
    @current_user = UserBase.last
    @kitty_name = @current_user.cat
    @first_name = @current_user.fname
    @last_name = @current_user.lname
    @salary = @current_user.salary
    @home = @current_user.home
  end

  def check_details
    @current_user = UserBase.last
    @kitty_name = @current_user.cat
    @first_name = @current_user.fname
    @last_name = @current_user.lname
    @salary = @current_user.salary
    @home = @current_user.home

    if @salary >= 30000 && @home >= 45
      @message = "Congratulations, #{@first_name}, our records show that you meet the criteria to adopt one of our cat! You have successfully adopted #{@kitty_name} <3 "
      case @kitty_name
        when "Grumpy"
          @pics = "grumpy.jpg"
        when "Zoe"
          @pics = "zoe.jpg"
        when "Venus"
          @pics = "venus.jpg"
        when "Redbull"
          @pics = "red.jpg"
      end
    else
      @message = "Dear #{@first_name}, we are sorry to inform that you do not meet the minimum criteria to adopt our cats. Please, wait a few months and try again."
      @pics = "sad.jpg"
    end

  end

end
