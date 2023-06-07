class EntitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_entity, only: %i[show edit update destroy]
  
    # GET /expenditures or /expenditures.json
    def index
      @group_id = Group.find(params[:group_id])
      @entity = Entity.where(group_id: @group_id.id)
    end
  
    # GET /expenditures/1 or /expenditures/1.json
    def show; end
  
    # GET /expenditures/new
    def new
      @group_id = Group.find(params[:group_id]).id
      @entity = Entity.new
    end
  
    # GET /expenditures/1/edit
    def edit; end
  
    # POST /expenditures or /expenditures.json
    def create
      @entity = Entity.new(entity_params)
      @entity.author_id = current_user.id
      @group = Group.find(params[:group_id])
  
      @entity.group_id = @group.id
  
      if @entity.save
        redirect_to user_group_entities_url(author_id: current_user.id, group_id: @group.id)
      else
        render :new
      end
    end
  
    # PATCH/PUT /expenditures/1 or /expenditures/1.json
    def update
      respond_to do |format|
        if @entity.update(entity_params)
          format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
          format.json { render :show, status: :ok, location: @entity}
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @entity.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /expenditures/1 or /expenditures/1.json
    def destroy
      @entity.destroy
  
      respond_to do |format|
        format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
  end
