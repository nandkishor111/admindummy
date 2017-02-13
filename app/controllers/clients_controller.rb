class ClientsController < ApplicationController
    before_action :authenticate_user! 
     load_and_authorize_resource
    def index
   	  @clients=Client.all
    end
     
    def show
     @client=Client.find(params[:id])     
    end 
    
    def new 
    	@client=Client.new
    end
    
    def create
      @client =Client.new(client_params)
      if @client.save
        redirect_to home_index_path
      else
        render 'new'
      end
    end

  

    def destroy
       @client = Client.find(params[:id])
       @client.destroy
       redirect_to clients_path, notice:  "The client #{@client.name} has been deleted."
    end

    
    private 
     def client_params
       params.require(:client).permit(:name, :email, :contact, :skills, :address)
     end

end
