class PackagesController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :only => [ :create ]

  def index
    @latest = Package.latest.limit(5)
  end

  def show
    @package = Package.find(params[:id])
  end

  def create
    @package = Package.create!(params[:package])
  end

  def search
    @packages = current_user.packages.search {
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

    redirect_to(@version.packaged_file.url)
  end
end
