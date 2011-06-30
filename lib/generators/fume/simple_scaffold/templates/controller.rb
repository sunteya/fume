class <%= controller_class_name %>Controller < ApplicationController

  def index
    @search = <%= "#{model_class_name}.search(params[:search])" %>
    <%= "@#{plural_model_name}" %> = @search.page(params[:page])
  end

  def new
    <%= "@#{singular_model_name}" %> = <%= "#{model_class_name}.new" %>
  end

  def create
    <%= "@#{singular_model_name}" %> = <%= "#{model_class_name}.new(params[:#{singular_model_name}])" %>
    
    if <%= "@#{singular_model_name}.save" %>
      flash[:notice] = '<%= human_name %> was successfully created.'
      redirect_to_ok_url_or_default :action => "index"
    else
      render :action => "new"
    end
  end

  def edit
    @<%= singular_model_name %> = <%= "#{model_class_name}.find(params[:id])" %>
  end

  def update
    <%= "@#{singular_model_name}" %> = <%= "#{model_class_name}.find(params[:id])" %>

    if <%= "@#{singular_model_name}.update_attributes(params[:#{singular_model_name}])" %>
      flash[:notice] = '<%= human_name %> was successfully updated.'
      redirect_to_ok_url_or_default :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    <%= "@#{singular_model_name}" %> = <%= "#{model_class_name}.find_by_id(params[:id])" %>
    <%= "@#{singular_model_name}.destroy" %> if @<%= singular_model_name %>
    
    redirect_to_ok_url_or_default :action => "index"
  end
end
