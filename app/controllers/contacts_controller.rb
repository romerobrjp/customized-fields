class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_filter :require_authentication

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

    if @contact.save
      redirect_to @contact, notice: "Contact created successfully"
    else
      render action: :new, notice: "Could not save this contact"
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: "Contact updated successfully"
    else
      redirect_to @contact, notice: "Could not update this contact"
    end
  end

  def destroy
    if @contact.destroy
      redirect_to @contact, notice: "Contact removed successfully"
    else
      redirect_to @contact, notice: "Contact could not be removed"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
