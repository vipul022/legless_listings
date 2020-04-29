class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]

    before_action :set_breeds_and_sexes, only: [:new, :edit, :create]
    def create
        #create new listing
        @listing = Listing.create(listing_params)
        
        if @listing.errors.any?
            render "new"
        else
            redirect_to listings_path
        end
    end
    


    def update
        #update the current listing
 
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

    def listing_params
        params.require(:listing).permit( :title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet)
    end
    

end