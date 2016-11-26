class UserController < ApplicationController

  def profile
    puts "IN IT"
    @firstn = params[:first_name]
    @lastn = params[:last_name]
    @salary = params[:salary]
    @home = params[:home_size]
    @user = UserBase.create({:fname => @firstn,
                            :lname => @lastn,
                             :income => @salary,
                             :space => @home})
  end

  def can_adopt

    if @salary < 20000 || @home < 45 then return false
    else return true
    end
  end
end
