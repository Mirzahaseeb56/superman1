class RolesController < ApplicationController
    before_action :authenticate_admin!
    before_action :find_role, only: [:edit, :update, :destroy]

    def index
        @roles=Role.all
    end

    def new
        @role=Role.new
    end


    def create
        @role= Role.new(role_params)
        if @role.save
            flash[:notice] = "role created successfully"
        redirect_to roles_path
        else 
            flash[:notice] = @role.errors.full_messages.join(",")
            redirect_to new_role_path
        end
    end


    def edit
    end

    def update 
        if @role.update(role_params)
            flash[:notice] = "role updated successfully"
            redirect_to roles_path
        else
            flash[:notice]= @role.errors.full_messages.join(",")
            redirect_to role_path(@role)
        end
            
    end
    def destroy
        if @role.destroy
            flash[:notice]= "role deleted successfully"
            redirect_to roles_path
        else
            flash[:notice]= @role.errors.full_messages.join(",")
            redirect_to role_path(@role)
        end
    end


    def find_role
        @role=Role.find_by id: params[:id]
        unless @role
            flash[:notice] = "role not found"
            redirect_to roles_path
        end
    end


    def role_params
        params.require(:role).permit(:name)
    end
end
