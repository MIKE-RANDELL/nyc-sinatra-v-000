class LandmarksController < ApplicationController
  get "/landmarks/new" do
    erb :"/landmarks/new"
  end

  post "/landmarks/new" do
    @landmark = Landmark.create(params[:landmark])
  end

  get "/landmarks" do
    erb :"/landmarks/show"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/single_show"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end

  post "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end
end
