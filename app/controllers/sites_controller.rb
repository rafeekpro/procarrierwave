# encoding: utf-8


class SitesController < ApplicationController

  # GET /sites
  # GET /sites.xml
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Site.new(params[:site])

    
     respond_to do |format|
       if @site.save
         format.html { redirect_to(@site, :notice => 'El fichero se ha subido con éxito.') }
         #format.xml  { render :xml => @site, :status => :created, :location => @site }
       	 format.js 
       else
#          format.html { render :action => "new" }
#          format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
		 render :new
       end
     end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to(@site, :notice => 'Site was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.xml
  def destroy
    @site = Site.find(params[:id])
    @site.remove_attachment!
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
    end
  end
  
  def upload 
  	if request.post?
        @site = Site.new

        filename, filedata = params['Filename'], params['Filedata']
		
        # do what you will with the uploaded file.... in my case i reshape the
        # params to look like those paperclip expects, including setting the
        # content type by using the mime-types plugin, but your needs may
        # vary.  once you have the filename and data, however, it's a walk in
        # the park compared to getting all the above working ;-)
		respond_to do |format|
      		if @site.update_attributes(params[:site])
       		 format.html { redirect_to(@site, :notice => 'Site was successfully updated.') }
       		 format.xml  { head :ok }
      		else
       		 format.html { render :action => "edit" }
       		 format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      		end
    	end
      end
  end
  
end
