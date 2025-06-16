from flask import request, jsonify
from src.services import member_service
import math
import re

# SHOW MEMBERS
def get_members():
    name = request.args.get('name')
    address = request.args.get('address')
    page = int(request.args.get('page', 1))
    limit = int(request.args.get('limit', 10))

    members, total = member_service.get_all_members(name, address, page, limit)

    data = [{
        "id": member.id,
        "name": member.name,
        "email": member.email,
        "phone": member.phone,
        "address": member.address,
    } for member in members]

    return jsonify({
        "data" : data,
        "pagination" : {
            "total" : total,
            "page" : page,
            "limit" : limit,
            "totalPages" : math.ceil(total / limit)
        }
    })

# GET MEMBER
def get_member(id):
    member = member_service.get_member_by_id(id)
    if not member:
        return {"error": "member not found"}, 404
    return jsonify(member.to_dict())

# VALIDATION EMAIL AND PHONE
def is_valid_email(email):
    return re.match(r"[^@]+@[^@]+\.[^@]+", email)

def is_valid_phone(phone):
    return re.match(r"^\+?\d{10,15}$", phone)

# CREATE MEMBER
def create_member():
    data = request.get_json()

    required_fields = ['name', 'email', 'phone', 'address']
    for field in required_fields:
        if not data.get(field):
            return jsonify({"error": f"{field} is required"}), 400

    if not is_valid_email(data['email']):
        return jsonify({"error": "Invalid email format"}), 400

    if member_service.is_email_exists(data['email']):
        return jsonify({"error": "Email already exists"}), 400

    if not is_valid_phone(data['phone']):
        return jsonify({"error": "Invalid phone number format"}), 400
        
    if member_service.is_phone_exists(data['phone']):
        return jsonify({"error": "Phone already exists"}), 400

    member = member_service.create_member(data)

    return jsonify({
        "id": member.id,
        "name": member.name,
        "email": member.email,
        "phone": member.phone,
        "address": member.address
    }), 201

# UPDATE MEMBER
def update_member(id):
    data = request.json
    member = member_service.update_member(id, data)
    if not member:
        return {"error": "member not found"}, 404
    return jsonify(member.to_dict())

# DELETE MEMBER
def delete_member(id):
    member = member_service.delete_member(id)
    if not member:
        return {"error": "member not found"}, 404
    return jsonify({"message": "Member deleted successfully"}), 204
