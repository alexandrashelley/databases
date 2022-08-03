require_relative 'book'

class BookRepository
  def all
    books = []

    sql = 'SELECT * FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |select|
      book = Book.new
    
      book.id = select['id']
      book.title = select['title']
      book.author_name = select['author_name']

      books << book
    end
      return books
  end
end