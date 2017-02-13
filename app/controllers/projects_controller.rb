class ProjectsController < ApplicationController
   before_action :authenticate_user! 
   
   def index
      @client=Client.find(params[:client_id])                                                                                                                                                                                                                                                              
      @projects=@client.projects.all
   end

   def new
   	@client=Client.find(params[:client_id])
      @project=Project.new
   end
   
   def edit
     @client = Client.find(params[:client_id])
     @project = @client.projects.find(params[:id])
   end
   
   def create
   	@client=Client.find(params[:client_id])
   	@project = @client.projects.new(project_params)
   	if @project.save
        redirect_to client_path(@client)
      end 
   end

   def update
     @client = Client.find(params[:client_id])
     @project= @client.projects(params[:id])
     if @project.update(project_params)
        redirect_to client_path(@client), notice: "The project #{@project.title} has been uploaded."
     else
        render 'edit'
     end
   end

   def destroy
      @client=Client.find(params[:client_id])
      @project=@client.projects.find(params[:id])
      @project.destroy
      redirect_to client_path(@client) 
    end
      
   private
      def project_params
        params.require(:project).permit(:title, :description, :gems, images_attributes:[:id, :attachimg, :_destroy])
      end  
end
                                                    