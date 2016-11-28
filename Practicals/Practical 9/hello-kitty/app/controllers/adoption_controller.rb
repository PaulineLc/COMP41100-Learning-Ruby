class AdoptionController < ApplicationController
  def kittenlisting
  end

  def adopt
    p 'HAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'

    @kitty_name = params[:cat]

    @f_name = params[:fname]
    @l_name = params[:lname]
    @income = params[:salary]
    @home_size = params[:home]
    @cat = params[:kitten]

    @user = UserBase.create({:fname => @f_name,
                             :cat => @cat,
                             :lname =>  @l_name,
                             :salary => @income,
                             :home => @home_size})

  end

end
