class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]

    def create
        #create new listing
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

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

end