from flask import Blueprint
from src.controllers import member_controller
from src.controllers import borrowing_controller

member_bp = Blueprint('member_bp', __name__)

member_bp.route('/', methods=['GET'])(member_controller.get_members)
member_bp.route('/<uuid:id>', methods=['GET'])(member_controller.get_member)
member_bp.route('/', methods=['POST'])(member_controller.create_member)
member_bp.route('/<uuid:id>', methods=['PUT'])(member_controller.update_member)
member_bp.route('/<uuid:id>', methods=['DELETE'])(member_controller.delete_member)
member_bp.route('/<uuid:member_id>/borrowings', methods=['GET'])(borrowing_controller.get_borrowings_by_member)
