class CalendarController < ApplicationController

#Add Calendar (HTTP GET)
  def addCal
    respond_to do |format|
      format.html
      format.js
    end
  end

  #Add Calendar (HTTP POST)
  def saveCal
    if Category.find_by_name(params[:category1]).nil?
      flash[:confirm]="Are you sure you want to add this category?"
      @Category=Category.new
      @Category.name=params[:category1]
      if (@Category.save!)
        flash[:notice]="Category successfully added"
      else
        flash[:error]="Something went wrong, Category addition failed"
      end
      # @bal.category_id= Category.find_by_name(params[:category]).id

    end
    @caln=Calendar.new
    @caln.name=params[:name1]
    @caln.Calid=params[:Calid1]
    @caln.category_id= Category.find_by_name(params[:category1]).id
    @caln.save
    if (@caln.save!)
      flash[:notice]="Calendar successfully added"
    else
      flash[:error]="Something went wrong"
    end
    redirect_to '/admin_home'
  end

  def editCal
    @book=Calendar.find(params[:id])
  end

  def updateCal
    if Category.find_by_name(params[:category]).nil?
      flash[:confirm]="Are you sure you want to add this category?"
      @Category=Category.new
      @Category.name=params[:category]
      if (@Category.save!)
        flash[:notice]="Category successfully added"
      else
        flash[:error]="Something went wrong, Category addition failed"
      end
      # @bal.category_id= Category.find_by_name(params[:category]).id

    end
    @bal=Calendar.find(params[:id])
    @bal.name=params[:name]
    @bal.Calid=params[:Calid]
    @bal.category_id= Category.find_by_name(params[:category]).id
    @bal.save
    puts params[:name]
    if (@bal.save!)
      flash[:notice]="Calendar succesfully edited"
    else
      flash[:error]="Something went wrong"
    end
    redirect_to '/admin_home'
  end

  # Delete Calendar (HTTP GET)
  def deleteConfirm
    @CurrentCal = Calendar.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def delete
    Calendar.find(params[:id]).destroy
    #Calendar.save
    flash[:success] = "Calendar deleted."
    #redirect_path_now='users/admin_home'
    redirect_to '/admin_home'

  end


end