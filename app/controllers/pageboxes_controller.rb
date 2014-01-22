class PageboxesController < ApplicationController
  # GET /pages/1/pageboxes
  # GET /pages/1/pageboxes.json
  def index
    @pageboxes = Pagebox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pageboxes }
    end
  end

  # GET /pages/1/pageboxes/1
  # GET /pages/1/pageboxes/1.json
  def show
    @pagebox = Pagebox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @pagebox }
    end
  end

  # GET /pages/1/pageboxes/new
  # GET /pages/1/pageboxes/new.json
  def new
    @page = Page.find(params[:page_id])
    @pagebox = @page.pageboxes.build

    @pagebox_types = ["image", "iframe"]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @pagebox }
    end
  end

  # GET /pages/1/pageboxes/1/edit
  def edit
    @pagebox = Pagebox.find(params[:id])
    @page = @pagebox.page
  end

  # POST /pages/1/pageboxes
  # POST /pages/1/pageboxes.json
  def create
    @page = Page.find(params[:page_id])

    @pagebox = @page.pageboxes.build(params[:pagebox])

    respond_to do |format|
      if @pagebox.save!
        format.html { redirect_to(@page, :notice => 'Pagebox was successfully created.') }
        format.xml  { render :xml => @pagebox, :status => :created, :location => @pagebox }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pagebox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1/pageboxes/1
  # PUT /pages/1/pageboxes/1.json
  def update
    @pagebox = Pagebox.find(params[:id])
    @page = @pagebox.page

    respond_to do |format|
      if @pagebox.update_attributes(params[:pagebox])
        format.html { redirect_to @page, :notice => 'Pagebox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @pagebox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1/pageboxes/1
  # DELETE /pages/1/pageboxes/1.json
  def destroy
    @pagebox = Pagebox.find(params[:id])
    @id = @pagebox.page_id
    @pagebox.destroy

    respond_to do |format|
      format.html { redirect_to "/pages/#{@id}" }
      format.json { head :no_content }
    end
  end
end
