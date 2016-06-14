class FieldsController < ApplicationController
  before_filter :require_authentication

  def index
    @fields = Field.all
  end

  def new
    @field = Field.new
  end

  def show
  end

  def create
    @field = Field.new(field_params)

    if @field.save
      redirect_to @field, notice: "Field created successfully"
    else
      render action: :new, notice: "Could not save this field"
    end
  end

  def edit
  end

  def update
    if @field.update(field_params)
      redirect_to @field, notice: "Field updated successfully"
    else
      redirect_to @field, notice: "Could not update this field"
    end
  end

  def destroy
    if @field.destroy
      redirect_to @field, notice: "Field removed successfully"
    else
      redirect_to @field, notice: "Field could not be removed"
    end
  end

  private

  def field_params
    params.require(:field).permit(:name, :type, :description)
  end

  def set_field
    @field = Field.find(params[:id])
  end
end
