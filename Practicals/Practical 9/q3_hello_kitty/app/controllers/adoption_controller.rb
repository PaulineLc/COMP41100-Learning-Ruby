class AdoptionController < ApplicationController
  def kittenlisting
    @available_kitten = {'Grumpy' => 'grumpy.jpg',
                         'RedBull' => 'red.jpg',
                         'Venus' => 'venus.jpg',
                         'Zoe' => 'zoe.jpg'}
  end

  def adopt
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
