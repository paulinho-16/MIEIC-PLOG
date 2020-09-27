% type(x) -> x is a type of book
type('romance').
type('fiction').

% book(x, y) -> x is a book of type y
book('Os Maias', 'romance').

% nationality(x) -> x is a nationality
nationality('português').
nationality('inglês').

% author(x, y) -> x is an author with nationality y
author('Eça de Queiroz', 'português').

% wrote(x, y) -> the author x wrote the book y
wrote('Eça de Queiroz', 'Os Maias').

% portuguese_romanticists(Author) -> returns the portuguese authors that wrote a romance
portuguese_romanticists(Author) :- author(Author, 'português'), wrote(Author, Book), book(Book, 'romance').

% fiction_and_others(Author) -> returns the authors of a fiction book that also wrote books of other types
fiction_and_others(Author) :- author(Author, _), wrote(Author, Book1), book(Book1, 'fiction'), wrote(Author, Book2), \+ book(Book2, 'fiction').

/*
    alínea a):
        - wrote(Author, 'Os Maias').
    alínea b):
        - portuguese_romanticists(Author).
    alínea c):
        - fiction_and_others(Author).
*/