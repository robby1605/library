from src.models.book import Book
from src.config.database import db
from sqlalchemy import func

# GET BOOKS
def get_all_books(title=None, author=None, page=1, limit=10):
    query = Book.query

    if title:
        query = query.filter(func.lower(Book.title).like(f"%{title.lower()}%"))
    if author:
        query = query.filter(func.lower(Book.author).like(f"%{author.lower()}%"))
    
    total = query.count()
    books = query.offset((page - 1) * limit).limit(limit).all()

    return books, total

# GET BOOK
def get_book_by_id(id):
    return Book.query.get(id)

# POST BOOK
def create_book(data):
    book = Book(**data)
    db.session.add(book)
    db.session.commit()
    return book

# PUT BOOK
def update_book(id, data):
    book = get_book_by_id(id)
    if not book:
        return None
    for key, value in data.items():
        setattr(book, key, value)
    db.session.commit()
    return book

# DEL BOOK
def delete_book(id):
    book = get_book_by_id(id)
    if not book:
        return None
    db.session.delete(book)
    db.session.commit()
    return book
