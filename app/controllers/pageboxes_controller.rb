class PageboxesController < ApplicationController
  include PageboxesHelper

  # GET /pageboxes
  # GET /pageboxes.json
  def index
    @pageboxes = Pagebox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pageboxes }
    end
  end

  # GET /pageboxes/1
  # GET /pageboxes/1.json
  def show
    @pagebox = Pagebox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @pagebox }
    end
  end

  # GET /pageboxes/new
  # GET /pageboxes/new.json
  def new
    @page = Page.find(params[:id])
    @pagebox = @page.pageboxes.build

    @pagebox_types = ["image", "iframe"]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @pagebox }
    end
  end

  # GET /pageboxes/1/edit
  def edit
    @pagebox = Pagebox.find(params[:id])
  end

  # POST /pageboxes
  # POST /pageboxes.json
  def create
    @page = Page.find(params[:id])

    @type = get_content_type(params[:source])

    if @type == 'image'
      params[:pagebox][:content] = "<img src=\"#{params['source']}\"></img>"
    else
      params[:pagebox][:content] = "<iframe src=\"#{params['source']}\"></iframe>"
    end

    @pagebox = @page.pageboxes.build(params[:pagebox])

    respond_to do |format|
      if @pagebox.save
        format.html { redirect_to(@page, :notice => 'Pagebox was successfully created.') }
        format.xml  { render :xml => @pagebox, :status => :created, :location => @pagebox }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pagebox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pageboxes/1
  # PUT /pageboxes/1.json
  def update
    @pagebox = Pagebox.find(params[:id])

    respond_to do |format|
      if @pagebox.update_attributes(params[:pagebox])
        format.html { redirect_to @pagebox, :notice => 'Pagebox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @pagebox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pageboxes/1
  # DELETE /pageboxes/1.json
  def destroy
    @pagebox = Pagebox.find(params[:id])
    @pagebox.destroy

    respond_to do |format|
      format.html { redirect_to pageboxes_url }
      format.json { head :no_content }
    end
  end
end
