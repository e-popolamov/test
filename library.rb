class Library

    def initialize
        @books = {}
    end

    def add_book(isbn, title, author, year)
        @books[isbn] = {title: title, author: author, year: year}
    end

    def remove_book(isbn)
        if @books.key?(isbn)
            @books.delete(isbn)
            puts "Deleted successfully"
        else
            puts "#{isbn} not found"
        end
    end

    def list_books (books = @books.values)
        books.each do |book|
            puts "\nISBN: #{book[:isbn]}, \nTitle: #{book[:title]}, \nAuthor: #{book[:author]}, \nYear: #{book[:year]}\n"
        end
    end

    def find_books_by_author (author)
        found = @books.values.select{|book| book[:author].casecmp?(author)}
        list_books(found)
    end

    def sort_books_by_year
        sorted = @books.values.sort_by {|book| book[:year]}
        list_books(sorted)
    end

end

# quick test

# library = Library.new
# library.add_book(9780743273565, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925) 
# library.add_book(9780393341423, 'Invisible Monsters', 'Chuck Palahniuk', 2011)
# library.add_book(9780393355949, 'Fight Club', 'Chuck Palahniuk', 2018)
# library.list_books
# library.sort_books_by_year
# library.find_books_by_author('Chuck Palahniuk')
# library.remove_book(9780393355949)