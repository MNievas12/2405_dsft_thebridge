from fastapi import FastAPI, requests
import sqlite3
import uvicorn

app = FastAPI()

conn = sqlite3.connect('books.db')
cursor = conn.cursor()

@app.get("/")
def hello():
    return "Hello world"

# 0.Ruta para obtener todos los libros
@app.get("/books")
async def get_books():
    cursor.execute("SELECT * FROM books")
    results = cursor.fetchall()
    return results

# 1.Ruta para obtener el conteo de libros por autor ordenados de forma descendente
@app.get("/books/authorcount")
async def get_authorcount():
    cursor.execute('''SELECT 
                        author, 
                        COUNT(title) 
                   FROM books 
                   GROUP BY 1
                   ORDER BY 2 DESC''')
    results = cursor.fetchall()
    return results

# 2.Ruta para obtener los libros de un autor
@app.get("/books/{author}")
async def get_book_by_author(author):
    cursor.execute('''SELECT 
                        *
                   FROM books 
                   WHERE author=?''', (author,))
    results = cursor.fetchall()
    return results

# 3.Ruta para añadir un libro
@app.post('/books')
async def post_book(id, published, author, title, first_sentence):
    cursor.execute('''INSERT INTO books (id, published, author, title, first_sentence) 
                    VALUES (?,?,?,?,?)''', (id, published,author,title,first_sentence))
    cursor.fetchall()
    conn.commit()
    return "Datos ingestados"

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)