import uuid
from sqlalchemy.dialects.postgresql import UUID
from src.config.database import db

class Borrowing(db.Model):
    __tablename__ = 'borrowings'

    id = db.Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    book_id = db.Column(UUID(as_uuid=True), db.ForeignKey('books.id'), nullable=False)
    member_id = db.Column(UUID(as_uuid=True), db.ForeignKey('members.id'), nullable=False)
    borrow_date = db.Column(db.Date, nullable=False)
    return_date = db.Column(db.Date)
    status = db.Column(db.String(10), nullable=False, default='BORROWED')

    def to_dict(self):
        return {
            "id": str(self.id),
            "book_id": str(self.book_id),
            "member_id": str(self.member_id),
            "borrow_date": self.borrow_date.isoformat(),
            "return_date": self.return_date.isoformat() if self.return_date else None,
            "status": self.status,
        }
