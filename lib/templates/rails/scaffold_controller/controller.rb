class <%= controller_class_name %>Controller < ApplicationController
<% unless options[:singleton] -%>
  
  respond_to :html, :xml, :json
  
  # GET /<%= table_name %>
  # GET /<%= table_name %>.xml
  def index
    respond_with(@<%= table_name %> = <%= orm_class.all(class_name) %>)
  end
<% end -%>

  # GET /<%= table_name %>/1
  # GET /<%= table_name %>/1.xml
  def show
    respond_with(@<%= file_name %> = <%= orm_class.find(class_name, "params[:id]") %>)
  end

  # GET /<%= table_name %>/new
  # GET /<%= table_name %>/new.xml
  def new
    respond_with(@<%= file_name %> = <%= orm_class.build(class_name) %>)
  end

  # GET /<%= table_name %>/1/edit
  def edit
    @<%= file_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  # POST /<%= table_name %>
  # POST /<%= table_name %>.xml
  def create
    @<%= file_name %> = <%= orm_class.build(class_name, "params[:#{file_name}]") %>

    if @<%= orm_instance.save %>
      respond_with(@<%= file_name %>, :status => :created)
    else
      respond_with(@<%= orm_instance.errors %>, :status => :unprocessable_entity)
    end
  end

  # PUT /<%= table_name %>/1
  # PUT /<%= table_name %>/1.xml
  def update
    @<%= file_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    
    if @<%= orm_instance.update_attributes("params[:#{file_name}]") %>
      respond_with(@<%= file_name %>, :status => :created)
    else
      respond_with(@<%= orm_instance.errors %>, :status => :unprocessable_entity)
    end
  end

  # DELETE /<%= table_name %>/1
  # DELETE /<%= table_name %>/1.xml
  def destroy
    @<%= file_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>

    respond_with(:location => <%= table_name %>_url, :head => :ok)
  end
end