from datetime import date, timedelta
import time
import requests
from bs4 import BeautifulSoup
import pymysql


def get_exchange_rate(source):
    """ Запрос данных с API источника """
    r = requests.get(source, timeout=5)
    return r.text

def get_value(valute_id):
    """ Возвращает значение курса валюты """
    value = soup.find('valute', {'id' : valute_id}).find('value').get_text()
    return float(value.replace(',', '.'))

def connect_to_db(func):
    """ Соединяется с базой данных """

    def wrapper(*args):
        dwh = pymysql.connect(
            host="localhost",
            user="my_sql_user",
            database="database_dwh",
            passwd="qwerty"
        )
        mycursor = dwh.cursor()
        query = func(args[0])
        mycursor.execute(query, args[1:])

        dwh.commit()

    return wrapper


@connect_to_db
def insert_to(table):
    """ Инсертит данные в таблицу """
    query = 'INSERT INTO ' + table + ' VALUES (%s, %s, %s, %s, %s)'
    return query


# def insert_to(table, *args):
#     """ Инсертит данные в таблицу """
#     mycursor = connect_to("database_dwh", "localhost", "my_sql_user", "qwerty")
#     query = 'INSERT INTO '+table+' VALUES (%s, %s, %s, %s, %s)'
#     mycursor.execute(query, args)
#     dwh.commit()
#     return query

currencies_id_cbrf= {
    'USD' : 'R01235',
    'EUR' : 'R01239',
    'CNY' : 'R01375',
    }
url = 'https://www.cbr.ru/scripts/XML_daily.asp?date_req='

histor_date = date.today()
for delta_day in range(30):
    historic_date = histor_date - timedelta(days=delta_day)
    str_date = historic_date.strftime('%d/%m/%Y')
    source = url + str_date
    raw_data = get_exchange_rate(source)
    time.sleep(0.5)

    soup = BeautifulSoup(raw_data, 'html.parser')

    for ticker in currencies_id_cbrf:
        value = get_value(currencies_id_cbrf[ticker])
        print(ticker, value, historic_date)
        insert_to('staging', ticker, "RUB", value, historic_date, "ЦБ РФ")

    #     insert = insert_to('staging', ticker, "RUB", value, historic_date, "ЦБ РФ")
    #     # query = 'INSERT INTO staging VALUES (%s, %s, %s, %s, %s)'
    #     # mycursor.execute(query, (ticker, "RUB", value, historic_date, "ЦБ РФ"))
    #     # dwh.commit()
    # print('RUB', 1.0, historic_date)
    # insert = insert_to('staging', "RUB", "RUB", 1, historic_date, "ЦБ РФ")
    # query = 'INSERT INTO `staging` VALUES (%s, %s, %s, %s, %s)'
    # mycursor.execute(query, ("RUB", "RUB", 1, historic_date, "ЦБ РФ"))
    # dwh.commit()

    # print(usd_float)