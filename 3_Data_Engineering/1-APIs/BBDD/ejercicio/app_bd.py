from fastapi import FastAPI, requests
# import sqlite3
import uvicorn

app = FastAPI()


@app.get("/")
def hello():
    return "Hello world"

# 0.Ruta para obtener todos los libros


# 1.Ruta para obtener el conteo de libros por autor ordenados de forma descendente


# 2.Ruta para obtener los libros de un autor


# 3.Ruta para añadir un libro

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)