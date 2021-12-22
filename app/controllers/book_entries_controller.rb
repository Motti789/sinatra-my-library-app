class BookEntriesController < ApplicationController

    get '/book_entries/new' do
        if logged_in?
      erb :'/book_entries/new'
        else
         redirect '/login'
        end
    end

    post '/book_entries' do
        if !logged_in?
            redirect '/'
        end
        if params[:title] !="" && params[:author] != "" && params[:genre] != ""
         @book_entry = BookEntry.create(title: params[:title], author: params[:author], genre: params[:genre],
         user_id: current_user.id)
          redirect "/book_entries/#{@book_entry.id}"
        else
         redirect '/book_entries/new'
        end
    end

    get '/book_entries/:id' do
      @book_entry = BookEntry.find(params[:id])
      erb :'/book_entries/show'
    end

    get '/book_entries/:id/edit' do
     @book_entry = BookEntry.find(params[:id])
     erb :'/book_entries/edit'
    end

    patch '/book_entries/:id' do
      "Hello World"
    end
    
end