from src.models.member import Member
from src.models.borrowing import Borrowing
from src.config.database import db
from sqlalchemy import func

# GET MEMBERS
def get_all_members(name=None, address=None, page=1, limit=10):
    query = Member.query

    if name:
        query = query.filter(func.lower(Member.name).like(f"%{name.lower()}%"))
    if address:
        query = query.filter(func.lower(Member.address).like(f"%{address.lower()}%"))
    
    total = query.count()
    members = query.offset((page - 1) * limit).limit(limit).all()

    return members, total

# GET MEMBER
def get_member_by_id(id):
    return Member.query.get(id)

# EMAIL VALIDATION
def is_email_exists(email):
    return Member.query.filter_by(email=email).first() is not None

# PHONE VALIDATION
def is_phone_exists(phone):
    return Member.query.filter_by(phone=phone).first() is not None

# POST MEMBER
def create_member(data):
    member = Member(**data)
    db.session.add(member)
    db.session.commit()
    return member

# PUT MEMBER
def update_member(id, data):
    member = get_member_by_id(id)
    if not member:
        return None
    for key, value in data.items():
        setattr(member, key, value)
    db.session.commit()
    return member

# DEL MEMBER
def delete_member(id):
    member = get_member_by_id(id)
    if not member:
        return None
    # Cek apakah masih ada peminjaman aktif
    active_borrowings = Borrowing.query.filter_by(member_id=id, status="BORROWED").count()
    if active_borrowings > 0:
        return None, "Member still has active borrowings"

    db.session.delete(member)
    db.session.commit()
    return member
