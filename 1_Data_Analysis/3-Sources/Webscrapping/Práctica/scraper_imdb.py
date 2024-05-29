from utils import * 

print("Webscrapping", url)
soup = get_html(url)

df = get_elements(["titulo", "año", "duracion", "ranking", "rating"], soup)

df.to_csv("./data/imdb_250_29_05_2024.csv")

print("Webscrapping terminado y almacenado en data")