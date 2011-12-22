class SiteController < ApplicationController
  
  def index
    @latest = Package.latest.limit(5)
  end
  
end
