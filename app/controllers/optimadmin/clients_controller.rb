module Optimadmin
  class ClientsController < Optimadmin::ApplicationController
    load_and_authorize_resource
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    edit_images_for Client, [[:logo, { show: ['fill', 132, 132] }]]

    def index
      @clients = Optimadmin::BaseCollectionPresenter.new(collection: Client.page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ClientPresenter)
    end

    def show
    end

    def new
      @client = Client.new
    end

    def edit
    end

    def create
      @client = Client.new(client_params)
      if @client.save
        redirect_to clients_url, notice: 'Client was successfully created.'
      else
        render :new
      end
    end

    def update
      if @client.update(client_params)
        redirect_to clients_url, notice: 'Client was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @client.destroy
      redirect_to clients_url, notice: 'Client was successfully destroyed.'
    end

    private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :logo, :remote_logo_url, :logo_cache, :website, :display)
    end
  end
end
