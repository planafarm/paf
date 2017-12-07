class HomeController < ApplicationController
  def index # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    if params[:sector]
      @record = Sector.find(params[:sector])
      @records = @record.sub_sectors.map { |e| e.attributes.merge("link" => url_for(sub_sector: e.id)) }
    elsif params[:sub_sector]
      @record = SubSector.find(params[:sub_sector])
      @records = @record.families.map { |e| e.attributes.merge("link" => url_for(family: e.id)) }
    elsif params[:family]
      @record = Family.find(params[:family])
      @records = @record.products.map { |e| e.attributes.merge("link" => url_for(product: e.id)) }
    elsif params[:product]
      @record = Product.find(params[:product])
      @records = []
    else
      @record = nil
      @records = Sector.all.map { |e| e.attributes.merge("link" => url_for(sector: e.id)) }
    end
  end
end
