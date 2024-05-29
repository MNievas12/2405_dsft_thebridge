from bs4 import BeautifulSoup as bs
import requests
import pandas as pd
from fake_useragent import UserAgent

url = "https://www.imdb.com/chart/top/?ref_=nv_mv_250"

def get_html(url):
    ua = UserAgent()
    headers = {'User-Agent': ua.random}


    response = requests.get(url, headers=headers)

    soup = bs(response.content, 'html.parser')
    return soup

def get_elements(elements_list, soup):

    my_dict = {}

    if "ranking" in elements_list:
        lista_ranking = []
        for elemento in soup.find_all("h3")[1:251]:
            lista_ranking.append(elemento.get_text().split(". ")[0])
        my_dict["ranking"] = lista_ranking

    if "titulo" in elements_list:
        lista_titulo = []
        for elemento in soup.find_all("h3")[1:251]:
            lista_titulo.append(elemento.get_text().split(". ")[1])
        my_dict["titulo"] = lista_titulo

    if "año" in elements_list:
        lista_año = []
        for elemento in soup.find_all("div", class_="sc-b189961a-7 feoqjK cli-title-metadata"):
            año = elemento.find_all('span')[0].get_text()
            lista_año.append(año)
        my_dict["año"] = lista_año

    if "duracion" in elements_list:
        lista_duracion = []
        for elemento in soup.find_all("div", class_="sc-b189961a-7 feoqjK cli-title-metadata"):
            duracion = elemento.find_all('span')[1].get_text()
            lista_duracion.append(duracion)
        my_dict["duracion"] = lista_duracion

    if "rating" in elements_list:
        lista_rating = []
        for elemento in soup.find_all('span', class_="ipc-rating-star ipc-rating-star--base ipc-rating-star--imdb ratingGroup--imdb-rating"):
            rating = float(elemento.get_text()[:3])
            lista_rating.append(rating)
        my_dict["rating"] = lista_rating

    df = pd.DataFrame(my_dict)

    return df