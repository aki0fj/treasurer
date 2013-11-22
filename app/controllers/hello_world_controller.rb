class HelloWorldController < ApplicationController
  def index
    @greeting = params[:greeting]
    render
  end
  def searchresult
    keyword = params[:search][:word]
    p params[:objects]
    @discusses = Journal.where("deb_acc_cd like "+"\"%#{keyword}%\""+ "or cre_acc_cd like "+"\"%#{keyword}%\"")
    respond_to do |format|
      format.js
    end
  end
end
