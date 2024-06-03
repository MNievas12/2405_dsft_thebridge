from variables import categories, ruta
from utils import Fichero


for categoria in categories:
    Fichero(ruta, categoria, categories[categoria])
    