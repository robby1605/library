from flask import request, jsonify
from src.services import book_service
import math

# GET BOOKS
def get_books():
    title = request.args.get('title')
    author = request.args.get('author')
    page = int(request.args.get('page', 1))
    limit = int(request.args.get('limit', 10))

    books, total = book_service.get_all_books(title, author, page, limit)

    data = [{
        "id": book.id,
        "title": book.title,
        "author": book.author,
        "published_year": book.published_year,
        "stock": book.stock,
        "isbn": book.isbn,
        "available": book.stock > 0
    } for book in books]

    return jsonify({
        "data" : data,
        "pagination" : {
            "total" : total,
            "page" : page,
            "limit" : limit,
            "totalPages" : math.ceil(total / limit)
        }
    })

# GET BOOK
def get_book(id):
    book = book_service.get_book_by_id(id)
    if not book:
        return {"error": "Book not found"}, 404
    return jsonify(book.to_dict())

# CRETE BOOK
def create_book():
    data = request.json
    book = book_service.create_book(data)
    return jsonify(book.to_dict()), 201

# UPDATE BOOK
def update_book(id):
    data = request.json
    book = book_service.update_book(id, data)
    if not book:
        return {"error": "Book not found"}, 404
    return jsonify(book.to_dict())

# DELETE BOOK
def delete_book(id):
    book = book_service.delete_book(id)
    if not book:
        return {"error": "Book not found"}, 404
    return '', 204
