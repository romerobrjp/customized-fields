class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :user_fields, only: [:edit, :new, :show]
  before_filter :authenticate_user!

  def index
    @contacts = Contact.where(user: current_user)
  end

  def new
    @contact = Contact.new
  end

  def show
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user

    custom_fields_params.each do |key, val|
      custom_field = Field.joins(:user).where(user_id: current_user.id, name: key).first
      field_value = FieldValue.new(value: val, user_id: current_user.id, contact: @contact, field_id: custom_field.id)
      field_value.save
    end

    if @contact.save
      redirect_to :contacts, notice: "Contact created successfully"
    else
      render action: :new, notice: "Could not save this contact"
    end
  end

  def edit

  end

  def update
    custom_fields_params.each do |key, val|
      custom_field = Field.joins(:user).where(user_id: current_user.id, name: key).first
      field_value = FieldValueQuery.new(custom_field.field_values).search.specific(@contact.id, custom_field.id)
      #field_value = FieldValueQuery.new(custom_field.field_values).search.from_contact(@contact.id))

      if field_value.exists?
        field_value.first.update(value: val)
      else
        field_value = FieldValue.new(value: val, contact: @contact, field_id: custom_field.id)
        field_value.save
      end
    end

    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contact updated successfully"
    else
      redirect_to :contacts, notice: "Could not update this contact"
    end
  end

  def destroy
    if @contact.destroy
      redirect_to :contacts, notice: "Contact removed successfully"
    else
      redirect_to :contacts, notice: "Contact could not be removed"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email)
  end

  def custom_fields_params
    params.fetch(:custom_field, {}).permit!
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def user_fields
    @user_fields = current_user.fields
  end
end
