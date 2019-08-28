class PagesController < ApplicationController
  def home
    authorize(self)
  end
end
