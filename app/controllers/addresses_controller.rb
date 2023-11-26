class AddressesController < ApplicationController
    def index
        @addresses = current_user.addresses
    end

    def new 
        @address = current_user.addresses.new
    end

    def create 
        @address = current_user.addresses.new(address_params)
        if @address.save
            flash[:notice] = 'Endereço cadastrado com sucesso!'
            redirect_to action: :index
        else
            flash[:notice] = 'Erro ao cadastrar endereço!'
            render :new
        end
    end

    def show; end

    def edit; end
    
    def update; end
    
    def destroy; end

    def address_params
        params.require(:address).permit(
          :name, :street, :neighborhood, :number, :complement, :zipcode, :city, :state
        )
    end
end     