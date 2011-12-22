class PackagesController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :only => [ :create ]

  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def search
    @packages = Package.search {
      fulltext "%#{params[:q]}%"
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
