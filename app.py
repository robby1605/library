import os
from flask import Flask
from dotenv import load_dotenv
from src.config.database import init_db
from src.routes.book_route import book_bp
from src.routes.member_route import member_bp
from src.routes.borrowing_route import borrowing_bp


def create_app():
    
    load_dotenv()

    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    init_db(app)

    app.register_blueprint(book_bp, url_prefix='/api/books')
    app.register_blueprint(member_bp, url_prefix='/api/members')
    app.register_blueprint(borrowing_bp, url_prefix='/api/borrowings')

    @app.errorhandler(404)
    def not_found(error):
        return {"error": "Not found"}, 404

    @app.errorhandler(500)
    def internal_error(error):
        return {"error": "Internal server error"}, 500

    return app

if __name__ == "__main__":
    app = create_app()
    app.run(debug=True)
