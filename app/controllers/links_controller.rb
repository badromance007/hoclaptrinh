class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all.order("created_at desc")
    gon.links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    #@link = Link.new
    @link = current_user.links.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    #@link = Link.new(link_params)
    @link = current_user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def linkpreview
    require 'open-uri'
    doc = Nokogiri::HTML(open(params[:url]), nil, 'UTF-8')
             
    title = ""
    description = ""
    url = ""
    image_url = ""
     
    doc.xpath("//head//meta").each do |meta|
        if meta['property'] == 'og:title'
            title = meta['content']
        elsif meta['property'] == 'og:description' || meta['name'] == 'description'
            description = meta['content']
        elsif meta['property'] == 'og:url'
            url = meta['content']
        elsif meta['property'] == 'og:image'
            image_url = meta['content']
        end
    end
     
    if title == ""
        title_node = doc.at_xpath("//head//title")
        if title_node
            title = title_node.text
        elsif doc.title
            title = doc.title
        else
            title = param_url
        end
    end
     
    if description ==""
        #maybe search for content from BODY
        description = title
    end
     
    if url ==""
        url = param_url
    end
     
    render :json => {:title => title, :description => description, :url => url, :image_url => image_url} and return
  end




  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote 
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote 
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
