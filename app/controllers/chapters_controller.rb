class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def show
    @chapters = Chapter.find(params[:id])
  end


end
