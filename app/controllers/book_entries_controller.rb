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
      set_book_entry
      erb :'/book_entries/show'
    end

    get '/book_entries/:id/edit' do
        set_book_entry
        if logged_in?
        if @book_entry.user == current_user
        erb :'/book_entries/edit'
        else
          redirect "users/#{current_user.id}"
        end
    else
        redirect '/'

        end
    end

    patch '/book_entries/:id' do
      set_book_entry
      if logged_in?
      if @book_entry.user == current_user

      @book_entry.update(title: params[:title], author: params[:author], genre: params[:genre])
      redirect "/book_entries/#{@book_entry.id}"
      else
      redirect "users/#{current_user.id}"
      end
     else
        redirect '/'
     end
    end

    private

    def set_book_entry
      @book_entry = BookEntry.find(params[:id])
    end
    
end