class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.create(params[:figure])
    #@figure = Figure.create(name: params[:figure][:name])

    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title #NOT SURE ABOUT THIS '<<'
    end

    #@figure.title_ids = params[:figure][:title_ids] #FROM CHECKBOX '='

    if !params[:landmark][:name].empty?
      @landmark = Landmark.new(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end

    @figure.save
  end

  get '/figures' do
    erb :'/figures/show'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/single_show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    @figure.save

    #redirect '/figures/#{params[:id]}' SINGLE QUOTES ON REDIRECT DON'T WORK!
    redirect "/figures/#{@figure.id}"
  end



end
