# Rails API Tutorial

This repository provides a step-by-step guide on how to create a Ruby on Rails API, seed it with fake data using the Faker gem, and test the API endpoints using Postman.

## Table of Contents

1. [Creating a Rails API](#creating-a-rails-api)
2. [Setting Up the Database](#setting-up-the-database)
3. [Generating Models and Controllers](#generating-models-and-controllers)
4. [Implementing API Endpoints](#implementing-api-endpoints)
5. [Seeding Data with Faker](#seeding-data-with-faker)
6. [Testing API Endpoints with Postman](#testing-api-endpoints-with-postman)

## Creating a Rails API

1. Install Ruby and Rails if you haven't already.

2. Open your terminal and run the following command to create a new Rails API-only application:

```
rails new my_api --api --database=postgresql
```
3. Change into the project directory:

```
cd my_api
```

## Setting up the database

1. Open the 'config/database.yml` file and configure your PostgreSQL connection details
2. Create the database:

```
rails db:create
```
## Generate models and controllers

1. Generate a model (e.g, Article)

```
rails g model Article title:string content:text
```
2. Run the migration:

```
rails db:migrate
```
3. Generate a namespaced controller:

```
rails g controller Api::V1::Articles
```
## Implementing API Endpoints

1. Define your routes in `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
```
2. Implement controller actions in app/controllers/api/v1/articles_controller.rb:

```ruby
class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render json: article
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
```
## Seeding Data with Faker
1. Add the faker gem to your Gemfile

```ruby
gem 'faker'
```

2. Run `bundle/install`
3. Edit `db/seeds.rb`

```ruby
require 'faker'

50.times do
  Article.create!(
    title: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    content: Faker::Lorem.paragraphs(number: 3).join("\n\n")
  )
end
```
4. Run the seed file:

```
rails db:seed
```
## Testing API Endpoints with Postman

1. Install Postman client on desktop, and open Postman

2. Start your Rails server:

```
rails s
```
3. Send the requests and observe the responses. In this example, you can try `http://localhost:3000/api/v1/articles/1`. You can replace `1` with the actual iD of the article you want to interact with.

This README provides a comprehensive guide that covers creating a Rails API, setting up the database, implementing API endpoints, seeding data with Faker, and testing the API using Postman. It's structured in a way that's easy to follow and includes all the necessary steps and code snippets.





