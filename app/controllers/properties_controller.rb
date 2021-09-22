class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, only: %i[ new edit update destroy ]
  before_action :set_sidebar, except: [:show]
  before_action :correct_account, only: [:edit, :update, :destroy]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
    @properties_list = Property.all.where(account_id: @property_account_id ).where.not(id: @property_account_id)
  end

  # GET /properties/1 or /properties/1.json
  def show
   @agent = @property.account
   @agent_properties = Property.where(account_id: @agent.id).where.not(id: @property.id).limit(3)
  end

    # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  def profile
    @account = Account.find(params[:id])
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.account_id = current_account.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, address: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, address: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def book_viewing
    agent_id = params[:agent_id]
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]  
    phone = params[:phone]

    ViewingMailer.viewing( agent_id, first_name, last_name, email, phone ).deliver_now

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def correct_account
    @property = current_account.properties.find_by(id: params[:id])
    redirect_to properties_path, notice: "Not Authorized to Edit this Property" if @property.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    def set_sidebar
      @show_sidebar = true
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :for_rent, :available_date, :details, images: [] )
    end
end
