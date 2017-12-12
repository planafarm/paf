class DataController < ApplicationController
  skip_before_action :verify_authenticity_token

  def hook
    @entry = Entry.new(entry_attrs)
    if @entry.save
      render json: @entry
    else
      logger.info @entry.errors
      render json: { errors: @entry.errors }, status: :unprocessable_entity
    end
  end

  private

  def valid_params?
    entry_attrs.slice(:user_id, :index, :data).all? { |_k, v| v.present? }
  end

  def entry_attrs
    @entry_attrs ||= begin
      base = { index: index, data: data }
      extra = extract_keys.each_with_object({}) { |e, a| a[e] = extract_from_raw_request(e) }
      base.merge(extra)
    end
  end

  def index
    params[:formTitle]
  end

  def raw_request
    if @raw_request_set
      @raw_request
    else
      @raw_request_set = true
      @raw_request = begin
        JSON.parse(params[:rawRequest])
      rescue JSON::ParserError
        nil
      end
    end
  end

  def extract_keys
    %i[user_id sector sub_sector family product]
  end

  def data
    raw_request.reject do |k, _v|
      extract_keys.any? { |extract_key| k =~ /#{extract_key}$/ }
    end
  end

  def extract_from_raw_request(key)
    return unless raw_request
    key = raw_request.keys.find { |k| k =~ /#{key}$/ }
    raw_request[key] if key
  end
end
