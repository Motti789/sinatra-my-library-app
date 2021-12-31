class BookEntriesController < ApplicationController

    get '/book_entries' do
      @book_entries = BookEntry.all
      erb :'/book_entries/index'
    end
    
    
    
    
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
        if authorized_to_edit?(@book_entry)
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
      if authorized_to_edit?(@book_entry)

      @book_entry.update(title: params[:title], author: params[:author], genre: params[:genre])
      redirect "/book_entries/#{@book_entry.id}"
      else
      redirect "users/#{current_user.id}"
      end
     else
        redirect '/'
     end
    end

    delete '/book_entries/:id' do
      set_book_entry
      if authorized_to_edit?(@book_entry)
        @book_entry.destroy
        flash[:message1] = "Successfully deleted your entry!"
        redirect '/book_entries'
      else
      redirect '/book_entries'
      end
    end

    private

    def set_book_entry
      @book_entry = BookEntry.find(params[:id])
    end
    
end