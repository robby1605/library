from flask import Blueprint, request, jsonify
from datetime import date
from src.config.database import db
from src.models.book import Book 
from src.models.borrowing import Borrowing 
from src.models.member import Member
from src.services import borrowing_service 
import uuid


# LIST BORROWING
def get_all_borrowings():
    title = request.args.get('title')
    author = request.args.get('author')
    page = int(request.args.get('page', 1))
    limit = int(request.args.get('limit', 10))

    borrowings, total = borrowing_service.get_all_borrowings(title, author, page, limit)

    return jsonify({
        "data": [b.to_dict() for b in borrowings],
        "total": total,
        "page": page,
        "limit": limit
    })

# BORROWED BOOK
def create_borrowing():
    data = request.get_json()
    book_id = data.get('book_id')
    member_id = data.get('member_id')

    # UUID VALIDATION
    try:
        book_uuid = uuid.UUID(book_id)
        member_uuid = uuid.UUID(member_id)
    except ValueError:
        return jsonify({"error": "Invalid UUID format"}), 400

    # CHECK BOOK
    book = Book.query.get(book_uuid)
    if not book:
        return jsonify({"error": "Book not found"}), 404
    if book.stock <= 0:
        return jsonify({"error": "Book out of stock"}), 400

    # Count the number of books still borrowed by members
    active_borrowings = Borrowing.query.filter_by(member_id=member_uuid, status='BORROWED').count()
    if active_borrowings >= 3:
        return jsonify({"error": "Member has reached maximum borrowed books (3)"}), 400

    borrowing_data = {
        "book_id": book_uuid,
        "member_id": member_uuid,
        "borrow_date": date.today(),
        "status": "BORROWED"
    }
    borrowing = borrowing_service.create_borrowing(borrowing_data)
    return jsonify(borrowing.to_dict()), 201

# RETURN BORROWED BOOK
def return_borrowing(id):
    borrowing, error = borrowing_service.return_borrowing(id)
    if error:
        return jsonify({"error": error}), 400
    return jsonify(borrowing.to_dict()), 200

# BORROWING BY MEMBER
def get_borrowings_by_member(member_id):
    status = request.args.get('status')
    page = int(request.args.get('page', 1))
    limit = int(request.args.get('limit', 10))

    borrowings, total = borrowing_service.get_borrowings_by_member(
        member_id, status, page, limit
    )

    result = []
    for borrowing, book in borrowings:
        result.append({
            "borrowing": borrowing.to_dict(),
            "book": {
                "id": str(book.id),
                "title": book.title,
                "author": book.author,
                "published_year": book.published_year,
                "isbn": book.isbn
            }
        })

    return jsonify({
        "data": result,
        "total": total,
        "page": page,
        "limit": limit
    })
