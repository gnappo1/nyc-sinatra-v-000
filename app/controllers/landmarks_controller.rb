class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :"landmarks/index"
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @figure = Figure.create(params[:figure])
    @landmark.figures << @figure unless @figure == nil
    @title = Title.create(params[:title])
    @landmark.titles << @title unless @title == nil
    redirect to "/figures/#{figure.id}"
  end

  get '/landmarks/new'do
    erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
