require_relative 'lib/database_connection'

DatabaseConnection.connect('book_store')

result = DatabaseConnection.exec_params('SELECT * FROM books;', [])

book_repository.all.each do |book|
    puts "#{book.id} - #{book.title} - #{book.author_name}"
  end