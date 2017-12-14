class HomeController < ApplicationController
  before_action :authenticate_user!

  def index # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    if params[:sector]
      @record = Sector.find(params[:sector])
      @records = @record.sub_sectors.map { |e| e.attributes.merge("link" => url_for_record(e)) }
    elsif params[:sub_sector]
      @record = SubSector.find(params[:sub_sector])
      @records = @record.families.map { |e| e.attributes.merge("link" => url_for_record(e)) }
    elsif params[:family]
      @record = Family.find(params[:family])
      @records = @record.products.map { |e| e.attributes.merge("link" => url_for_record(e)) }
    elsif params[:product]
      @record = Product.find(params[:product])
      @records = []
    else
      @record = nil
      @records = Sector.all.map { |e| e.attributes.merge("link" => url_for_record(e)) }
    end
    set_parents
    set_jotform_params
  end

  protected

  def set_jotform_params
    @jotform_params = { user_id: current_user.id }.merge(jotform_params_helper(@record))
  end

  def jotform_params_helper(record)
    if record.nil?
      {}
    else
      jotform_params_helper(record.parent).merge(record.class.name.underscore.to_sym => record.name)
    end
  end

  def url_for_record(record)
    url_for(record.class.name.underscore.to_sym => record.id)
  end
  helper_method :url_for_record

  def set_parents
    @parents = parents_helper(@record&.parent)
  end

  def parents_helper(record)
    if record.nil?
      []
    else
      parents_helper(record.parent) + [record]
    end
  end

  def entry_form
    if @entry_form_set
      @entry_form
    else
      @entry_form_set = true
      @entry_form = begin
        compute_entry_form(@record)
      end
    end
  end
  helper_method :entry_form

  def compute_entry_form(record)
    record ? (record["info"] || {})["form"] || compute_entry_form(record.parent) : nil
  end
end
