class FiguresController < ApplicationController

  get '/figures' do
    erb :"figures/index"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark unless @landmark == nil
    @title = Title.create(params[:title])
    @figure.titles << @title unless @title == nil
    redirect to "/figures/#{figure.id}"
  end

  get '/figures/new'do
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark unless @landmark == nil
    @title = Title.create(params[:title])
    @figure.titles << @title unless @title == nil
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
