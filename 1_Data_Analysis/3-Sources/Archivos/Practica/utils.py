import os
import shutil

def crear_carpetas(ruta):
    os.chdir(ruta)
    os.makedirs("Documentos", exist_ok=True)
    os.makedirs("Imagenes", exist_ok=True)
    os.makedirs("Software", exist_ok=True)
    os.makedirs("Otros", exist_ok=True)


def mover_archivos(ruta, categories):
    for archivo in os.listdir(ruta):
    # Comprobamos si es una carpeta
        if os.path.isdir(os.path.join(ruta, archivo)):
            continue

        print("Moviendo...", archivo)
        # Comprobamos la extensión del archivo para moverlo
        if archivo.endswith(categories['doc']):
            shutil.move(archivo, "Documentos")
        elif archivo.endswith(categories['img']):
            shutil.move(archivo, "Imagenes")
        elif archivo.endswith(categories['sw']):
            shutil.move(archivo, "Software")
        else:
            shutil.move(archivo, "Otros")


class Fichero:

    def __init__(self, ruta, categoria, extensions):
        self.ruta = ruta
        self.categoria = categoria
        self.extensions = extensions
        self.crear_carpetas()
        self.mover_archivos()

    def crear_carpetas(self):
        os.chdir(self.ruta)
        os.makedirs(self.categoria, exist_ok=True)

    def mover_archivos(self):
        for archivo in os.listdir(self.ruta):
        # Comprobamos si es una carpeta
            if os.path.isdir(os.path.join(self.ruta, archivo)):
                continue
            print("Moviendo...", archivo)
            # Comprobamos la extensión del archivo para moverlo
            if archivo.endswith(self.extensions) or self.extensions == ():
                shutil.move(archivo, self.categoria)
    