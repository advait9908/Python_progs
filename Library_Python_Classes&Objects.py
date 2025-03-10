# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

class Book:
    def __init__(self, title, author, isbn):
        self.title = title
        self.author = author
        self.isbn = isbn
        self.is_checked_out = False

    def __str__(self):
        return f"'{self.title}' by {self.author} (ISBN: {self.isbn})"

class Library:
    def __init__(self):
        self.books = []

    def add_book(self, book):
        self.books.append(book)

    def check_out_book(self, isbn):
        for book in self.books:
            if book.isbn == isbn and not book.is_checked_out:
                book.is_checked_out = True
                return f"Book {book.title} checked out successfully."
        return "Book is not available."

    def return_book(self, isbn):
        for book in self.books:
            if book.isbn == isbn:
                book.is_checked_out = False
                return f"Book {book.title} returned successfully."
        return "Book not found."

    def available_books(self):
        available = [book for book in self.books if not book.is_checked_out]
        if available:
            return "\n".join(str(book) for book in available)
        return "No available books."

# Example Usage
library = Library()
library.add_book(Book("The Hobbit", "J.R.R. Tolkien", "12345"))
library.add_book(Book("1984", "George Orwell", "67890"))

print(library.available_books())
print(library.check_out_book("12345"))
print(library.available_books())
print(library.return_book("12345"))
print(library.available_books())
print(library.check_out_book("67890"))
print(library.available_books())
print(library.check_out_book("67890"))

