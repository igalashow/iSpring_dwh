from datetime import date, timedelta
import time
import requests
from bs4 import BeautifulSoup
import pymysql

def get_exchange_rate(source):
    """ Получает данные по курсам валют """
    r = requests.get(source, timeout=15)
    return r.text

def get_value(valute_id):
    """ Возвращает значение курса валюты """
    value = soup.find('valute', {'id' : valute_id}).find('value').get_text()
    return float(value.replace(',', '.'))

dwh = pymysql.connect(
  host="localhost",
  user="my_sql_user",
  database="database_dwh", #database
  passwd="qwerty"
)

mycursor = dwh.cursor()


currencies_id = {
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

    for ident in currencies_id:
        value = get_value(currencies_id[ident])
        print(ident, value, historic_date)
        query = 'INSERT INTO `staging` VALUES (ident, "RUB", value, historic_date, "ЦБ РФ")'
        mycursor.execute(query)
        dwh.commit()
    print('RUB', 1.0, historic_date)
    query = 'INSERT INTO `staging` VALUES ("RUB", "RUB", 1, historic_date, "ЦБ РФ")'
    mycursor.execute(query)
    dwh.commit()

    # print(usd_float)