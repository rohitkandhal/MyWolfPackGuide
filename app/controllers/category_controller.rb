class CategoryController < ApplicationController

  def edit
    @CurrentCat = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
#    @Cati=Category.find(params[:id])
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
end