class CategoryController < ApplicationController

  def edit
    @CurrentCat = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end


  def updateCategory
    @call=Category.find(params[:id])
    flash[:confirm]="Are you sure you want to edit this category?"
    @call.name=params[:name]
    if (@call.save!)
      flash[:notice]="Category successfully edited"
    else
      flash[:error]="Something went wrong, Category edition failed"
    end
    redirect_to '/admin_home'
  end

  # HTTP Get method
  def deleteConfirm
    @CurrentCat = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  #Delete category (Post)
  def delete
    if Calendar.find_by_category_id(params[:id])
      Calendar.find_by_category_id(params[:id]).destroy
    end

    Category.find(params[:id]).destroy
    #Calendar.save
    flash[:success] = "Category deleted."
    #redirect_path_now='users/admin_home'
    redirect_to '/admin_home'
  end

  #Add Category (HTTP GET)
  def addCat
    respond_to do |format|
      format.html
      format.js
    end
  end

  def saveCat
    @Category1=Category.new
    @Category1.name=params[:catName]
    if (params[:dept])
      @Category1.is_dept=params[:dept]
    else
      @Category1.is_dept=params[:dept1]
    end

    @Category1.is_dept=params[:dept]
    if (@Category1.save!)
      flash[:notice]="Category successfully added"
    else
      flash[:error]="Something went wrong, Category addition failed"
    end
    redirect_to '/admin_home'
  end
end