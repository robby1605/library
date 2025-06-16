from flask import Blueprint
from src.controllers import book_controller

book_bp = Blueprint('book_bp', __name__)

book_bp.route('/', methods=['GET'])(book_controller.get_books)
book_bp.route('/<uuid:id>', methods=['GET'])(book_controller.get_book)
book_bp.route('/', methods=['POST'])(book_controller.create_book)
book_bp.route('/<uuid:id>', methods=['PUT'])(book_controller.update_book)
book_bp.route('/<uuid:id>', methods=['DELETE'])(book_controller.delete_book)
