from src.models.borrowing import Borrowing
from src.models.book import Book
from src.config.database import db
from sqlalchemy import func
from datetime import date

# BORROWING BOOK
def create_borrowing(data):
    borrowing = Borrowing(**data)
    db.session.add(borrowing)
    
    book = Book.query.get(data["book_id"])
    if book:
        book.stock -= 1
    
    db.session.commit()
    return borrowing

# RETURN BOOK
def return_borrowing(id):
    borrowing = Borrowing.query.get(id)
    if not borrowing:
        return None, "Borrowing not found"
    
    if borrowing.status == "RETURNED":
        return None, "Book already returned"
    
    book = Book.query.get(borrowing.book_id)
    if not book:
        return None, "Book not found"

    borrowing.status = "RETURNED"
    borrowing.return_date = date.today()
    book.stock += 1

    db.session.commit()
    return borrowing, None

# BORROWING BY MEMBER
def get_borrowings_by_member(member_id, status=None, page=1, limit=10):
    query = Borrowing.query.filter_by(member_id=member_id)

    if status:
        query = query.filter_by(status=status.upper())

    total = query.count()
    borrowings = query \
        .join(Book, Borrowing.book_id == Book.id) \
        .add_entity(Book) \
        .offset((page - 1) * limit) \
        .limit(limit) \
        .all()

    return borrowings, total
