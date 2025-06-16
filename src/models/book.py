import uuid
from sqlalchemy.dialects.postgresql import UUID
from src.config.database import db

class Book(db.Model):
    __tablename__ = 'books'

    id = db.Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    title = db.Column(db.String(150), nullable=False, index=True)
    author = db.Column(db.String(100), nullable=False)
    published_year = db.Column(db.Integer, nullable=False)
    stock = db.Column(db.Integer, nullable=False)
    isbn = db.Column(db.String(13), nullable=False)

    def to_dict(self):
        return {
            "id": str(self.id),
            "title": self.title,
            "author": self.author,
            "published_year": self.published_year,
            "stock": self.stock,
            "isbn": self.isbn,
        }
