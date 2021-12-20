class BookEntriesController < ApplicationController

    get '/book_entries/new' do
      erb :'/book_entries/new'
    end

    
end