from fastapi import FastAPI, HTTPException
import uvicorn
import pickle
import pandas as pd
import sqlite3

app = FastAPI()

@app.get("/")
async def hello():
    return "Bienvenido a mi API del modelo advertising"

# 1. Endpoint de predicción
@app.get('/predict')
async def predict(data: dict):
    data = data.get('data', None)
    model = pickle.load(open('data/advertising_model.pkl', 'rb'))
    if not data:
        raise HTTPException(status_code=400, detail="No se han proporcionado datos para predecir. Añade la etiqueta 'data'.")
    try:
        prediction = model.predict(data)
        return {'prediction': prediction.tolist()}
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error al realizar las predicciones" + str(e))

# 2. Endpoint de ingesta de datos
@app.post('/ingest')
async def ingest(data: dict):
    new_data = data.get('data', None)
    if not new_data:
        raise HTTPException(status_code=400, detail="No se han proporcionado datos para ingestar. Añade la etiqueta 'data'.")
    try:
        conn = sqlite3.connect("data/advertising.db")
        cursor = conn.cursor()
        query = '''INSERT INTO campañas VALUES (?,?,?,?)'''
        for fila in new_data:
            cursor.execute(query,fila)
        conn.commit()
        conn.close()
        return {'message': 'Datos ingresados correctamente'}
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error al ingestar los datos. " + str(e))

# 3. Endpoint de reentramiento del modelo
@app.post('/retrain')
async def retrain():

    try:
        conn = sqlite3.connect("data/advertising.db")
        cursor = conn.cursor()
        query = '''SELECT * FROM campañas'''
        result = cursor.execute(query)
        df = pd.DataFrame(result)
        model = pickle.load(open('data/advertising_model.pkl', 'rb'))
        model.fit(df.iloc[:,:-1], df.iloc[:,-1])
        with open('data/advertising_model.pkl', 'wb') as file:
            pickle.dump(model, file)
        return {'message': 'Modelo reentrenado correctamente.'}

    except Exception as e:
        raise HTTPException(status_code=500, detail= "Error al reentrenar el modelo. " + str(e))

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)