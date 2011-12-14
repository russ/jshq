module V1
  class PackagesController < ApplicationController
    respond_to :html, :json
    skip_before_filter :verify_authenticity_token

    def index
      @packages = Package.all
      respond_with(@packages)
    end

    def show
      @package = Package.find_by_name(params[:id])
      respond_with(@package)
    end

    def create
      @package = Package.create!(params[:package])
      respond_with(@package)
    end

    def search
      @packages = Package.search {
        fulltext params[:q]
      }.hits.collect { |h| h.instance }
      respond_with(@packages)
    end

    def download
      @package = Package.find(params[:id])
      @version = if params[:version].blank?
        @package.versions.first
      else
        @package.versions.find_by_number(params[:version])
      end
      @version.download!

      respond_with(:url => @version.packaged_file.url)
    end
  end
end
