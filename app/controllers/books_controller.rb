# app/controllers/books_controller.rb
class BooksController < ApplicationController

  def index
    books = orchestrate_query(Book.all).map do |book|
      BookPresenter.new(book, params).fields.embeds
    end

    render json: { data: books }.to_json
  end

end