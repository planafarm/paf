class SuppliersController < ApplicationController
  before_action :authenticate_agent!

  def index
    authorize Supplier
    @suppliers = policy_scope(Supplier)
  end

  def show
    @supplier = policy_scope(Supplier).find(params[:id])
    authorize @supplier
  end

  def new
    @supplier = policy_scope(Supplier).new
    authorize @supplier
  end

  def edit
    @supplier = policy_scope(Supplier).find(params[:id])
    authorize @supplier
  end

  def create
    @supplier = policy_scope(Supplier).new(permitted_attributes(Supplier))
    authorize @supplier

    if @supplier.save
      redirect_to @supplier, notice: "Supplier was successfully created."
    else
      render :new
    end
  end

  def update
    @supplier = policy_scope(Supplier).find(params[:id])
    authorize @supplier
    if @supplier.update(permitted_attributes(Supplier))
      redirect_to @supplier, notice: "Supplier was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @supplier = policy_scope(Supplier).find(params[:id])
    authorize @supplier
    @supplier.destroy
    redirect_to suppliers_url, notice: "Supplier was successfully destroyed."
  end

  private

  def current_user
    current_agent
  end
end
