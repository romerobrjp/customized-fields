class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]
  before_filter :require_authentication

  def index
    @fields = FieldQuery.new.search.from_user(current_user)
  end

  def new
    @field = Field.new
  end

  def show
  end

  def create
    @field = Field.new(field_params)
    @field.user = current_user
    
    if @field.save
      redirect_to :fields, notice: "Field created successfully"
    else
      render action: :new, notice: "Could not save this field"
    end
  end

  def edit

  end

  def update
    if @field.update(field_params)
      redirect_to :fields, notice: "Field updated successfully"
    else
      redirect_to :fields, notice: "Could not update this field"
    end
  end

  def destroy
    if @field.destroy
      redirect_to :fields, notice: "Field removed successfully"
    else
      redirect_to :fields, notice: "Field could not be removed"
    end
  end

  private

  def field_params
    params.require(:field).permit(:name, :field_type, :description, :combobox_key_values)
  end

  def set_field
    @field = Field.find(params[:id])
  end
end
