class ProjectsController < ApplicationController
   before_action :authenticate_user! 
   def new
   	  @client=Client.find(params[:client_id])
      @project=Project.new
   end
   
   def index
      @client=Client.find(params[:client_id])                                                                                                                                                                                                                                                              
   	  @projects=@client.projects.all
   end

   def create
   	  @client=Client.find(params[:client_id])
   	  @project = @client.projects.new(project_params)
   	  if @project.save
        redirect_to client_path(@client)
      end 
   end
      
   private
      def project_params
        params.require(:project).permit(:title, :description, :gems, :attachment, images_attributes:[:id, :attachimg, :_destroy])
      end  
end
                                                    