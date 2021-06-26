from datetime import date, timedelta
import requests
import time
import json
import xml.etree.ElementTree as ET


def get_exchange_rate(source):
    """ Получает данные по курсам валют """
    r = requests.get(source, timeout=15)
    return r.text

if __name__ == "__main__":

    raw_data = json.loads(get_exchange_rate('https://www.cbr-xml-daily.ru/daily_json.js'))

    list_curr = ['USD', 'EUR', 'CNY']
    print(raw_data['Timestamp'])
    for currency in raw_data['Valute']:

        if currency in list_curr:
            rate = raw_data['Valute'][currency]['Value']
            print(currency, rate)
