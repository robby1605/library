
Install Python 3.11.9
Inttall Postgree SQL

Install Library Python
<!-- Install dari requirements.txt -->
pip install -r requirements.txt
<!-- Setelah install library baru, jangan lupa update requirements.txt dengan: -->
pip install -r requirements.txt

{
  "data": [
    {
      "book": {
        "author": "F. Scott Fitzgerald",
        "id": "164ac3dd-5e76-4324-ba00-21ea6ab6e8af",
        "isbn": "9780743273565",
        "published_year": 1925,
        "title": "The Great Gatsby"
      },
      "borrowing": {
        "book_id": "164ac3dd-5e76-4324-ba00-21ea6ab6e8af",
        "borrow_date": "2025-06-16",
        "id": "30db409c-c2bf-41d5-9241-18e402c27734",
        "member_id": "6c83d746-377b-43fe-854d-5088d7e3b91e",
        "return_date": null,
        "status": "BORROWED"
      }
    },
    {
      "book": {
        "author": "Stieg Larsson",
        "id": "b2592c38-bdc5-417b-aeae-f32e75186f3a",
        "isbn": "9780307949486",
        "published_year": 2005,
        "title": "The Girl with the Dragon Tattoo"
      },
      "borrowing": {
        "book_id": "b2592c38-bdc5-417b-aeae-f32e75186f3a",
        "borrow_date": "2025-06-16",
        "id": "b92cd192-0fe7-4665-b609-14444ca038df",
        "member_id": "6c83d746-377b-43fe-854d-5088d7e3b91e",
        "return_date": "2025-06-16",
        "status": "RETURNED"
      }
    }
  ],
  "limit": 10,
  "page": 1,
  "total": 2
}