from flask import Blueprint
from src.controllers import borrowing_controller

borrowing_bp = Blueprint('borrowing_bp', __name__)

borrowing_bp.route('/', methods=['GET'])(borrowing_controller.get_all_borrowings)
borrowing_bp.route('/', methods=['POST'])(borrowing_controller.create_borrowing)
borrowing_bp.route('/<uuid:id>/return', methods=['PUT'])(borrowing_controller.return_borrowing)
