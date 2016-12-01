class MainController < ApplicationController
  def index
    @welcome_messages = ['Welcome to Hello Kitty',
                         'Bienvenue sur Hello Kitty',
                         'Bienvenido a Hello Kitty',
                         'Fáilte go Hello Kitty',
                         'Willkommen bei Hello Kitty']

    @message_id = rand(@welcome_messages.length)

    @message = @welcome_messages[@message_id]

    @headline_messages = ['a love story',
                          'a great friendship',
                          'an adventure',
                          'making it happy']
    @headline_id = rand(@headline_messages.length)
    @headline = @headline_messages[@headline_id]
  end
end
