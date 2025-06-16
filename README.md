# 📚 Library Management API

A simple REST API for library management, built with Flask and PostgreSQL.

---

## ✅ Prerequisites

Before running this project, make sure you have installed:

- 🐍 Python version 3.11.9 (3.8+ supported)
- 🐘 PostgreSQL (Database Server)

---

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/robby1605/library.git
cd library
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Import Database from SQL File -> Using pgAdmin

- Open pgAdmin and connect to your PostgreSQL server.
- Create a new database named library_db (if not exists).
- Right-click on library_api → Restore → choose your .sql file.
- Set format to "Custom" or "Plain" depending on your export type.
- Click Restore.

### 4. Configure Environment Variables

Create a `.env` file and add the following content:

```
DATABASE_URL=postgresql://postgres:password@localhost:5432/library_db
```

### 5. Run the Server

```bash
flask run --debug
```
atau
```bash
python app.py
```

The application will be available at:  
`http://localhost:5000`

---

## 📘 API Documentation

### 🔖 Books

| Method | Endpoint           | Description        |
|--------|--------------------|--------------------|
| GET    | `/api/books`       | Retrieve book list |
| POST   | `/api/books`       | Add a new book     |
| PUT    | `/api/books/:id`   | Update a book      |
| DELETE | `/api/books/:id`   | Delete a book      |

---

### 👤 Members

| Method | Endpoint                      | Description                   |
|--------|-------------------------------|-------------------------------|
| GET    | `/api/members`                | Retrieve all members          |
| POST   | `/api/members`                | Create a new member           |
| PUT    | `/api/members/:id`            | Update member data            |
| DELETE | `/api/members/:id`            | Delete a member               |
| GET    | `/api/members/:id/borrowings` | View member borrowing history |

> **Query parameters** for `/members/:id/borrowings`:
> - `status` (`BORROWED` / `RETURNED`)
> - `page`
> - `limit`

---

### 📖 Borrowings

| Method | Endpoint                     | Description                   |
|--------|------------------------------|-------------------------------|
| GET    | `/api/borrowings`            | Retrieve all borrowings       |
| POST   | `/api/borrowings`            | Create a new borrowing record |
| PUT    | `/api/borrowings/:id/return` | Mark a book as returned       |

> ✅ **Borrowing Rules:**
> - Book stock must be greater than 0  
> - A member can borrow up to 3 books  
> - Book stock will be decreased  
> - `borrow_date` is set automatically  

> ✅ **Return Rules:**
> - Status is set to `RETURNED`  
> - `return_date` is set automatically  
> - Book stock will be increased  

---

## 🤝 Contributing

Pull requests are welcome!  
Feel free to fork the repository and submit improvements or bug fixes.
