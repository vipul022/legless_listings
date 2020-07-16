class ListingsController < ApplicationController
    #This will let all the users to view index and show page only
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    # before_action :set_user_listing, only: [:edit, :update, :destroy]
    before_action :set_breeds_and_sexes, only: [:new, :edit, :create]
    load_and_authorize_resource

    def create
        #create a listing for current signed in user
        @listing = current_user.listings.create(listing_params)
        #create new listing
        # @listing = Listing.create(listing_params)
        # byebug
        
        if @listing.errors.any?
            render "new"
        else
            redirect_to listings_path
        end
    end
    


    def update
        #update the current listing
       

        if @listing.update(listing_params)
          redirect_to listings_path
        else    
            set_breeds_and_sexes
            render "new"
        end  
 
    end

    def index
        #show all listings
        @listings = Listing.all
    end

    def edit
        #shows the edit form
        
    end

    def new
        #shows a form for creating new listing
        @listing = Listing.new
     
    end

    def destroy
        #deleted current listing
        @listing.destroy
        redirect_to listings_path
        
    end

    def show
        #show the single listing

       
    end

    private

    def set_breeds_and_sexes
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

    def set_user_listing
        id = params[:id]
        #find_by_id give nil if there is no listing of current user
        @listing = current_user.listings.find_by_id(id)
        
        if @listing == nil
        #boot the user out
          redirect_to listings_path
        end 
        # if @listing.user_id != current_user.id
        #    redirect_to listings_path
        # end   
    end

    def listing_params
        params.require(:listing).permit( :title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet, :picture)
    end
    

end