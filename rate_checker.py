from datetime import date, datetime
import time
import requests
from bs4 import BeautifulSoup
import pymysql
import db_auth


def erlog(*args):
    """ Логирование ошибок """
    log = open("erlog.txt", 'a', encoding='windows-1251')
    print('Дата '+str(datetime.today())[:-10], file=log)
    print('rate_checker.py', file=log)
    print(*args, file=log)
    log.close()
    print(*args)


def get_exchange_rate(source):
    """ Запрос данных с API источника """
    r = requests.get(source, timeout=5)
    return r.text


def get_value_cbrf(valute_id):
    """ Возвращает значение курса валюты """
    value = soup.find('valute', {'id': valute_id}).find('value').get_text()
    return float(value.replace(',', '.'))


def connect_to_db(func):
    """ Соединяется с базой данных """

    def wrapper(*args):
        dwh = pymysql.connect(
            host=db_auth.host,
            user=db_auth.user,
            database=db_auth.database,
            passwd=db_auth.passwd
        )
        mycursor = dwh.cursor()
        query = func(args[0])
        if len(args) <= 1:
            arguments = ''
        else:
            arguments = '%s, ' * (len(args) - 2) + '%s)'
        mycursor.execute(query+arguments, args[1:])
        dwh.commit()
        dwh.close()
        return mycursor.fetchall()
    return wrapper


@connect_to_db
def insert_to(table):
    """ Инсертит данные в таблицу """
    query = 'INSERT INTO '+table+' VALUES ('
    return query


currencies_id_cbrf = {
    'USD': 'R01235',
    'EUR': 'R01239',
    'CNY': 'R01375',
    }

url = 'https://www.cbr.ru/scripts/XML_daily.asp?date_req='

try:

    today_date = date.today()
    str_date = today_date.strftime('%d/%m/%Y')
    source = url + str_date
    try:
        raw_data = get_exchange_rate(source)
    except requests.ConnectionError as e:
        erlog("Ошибка соединения. Проверьте подключение к Интернет.")
        erlog(str(e))
        quit()
    except requests.Timeout as e:
        erlog("Timeout error.")
        erlog(str(e))
        quit()
    except requests.RequestException as e:
        erlog("General Error")
        erlog(str(e))
        quit()

    time.sleep(0.5)

    soup = BeautifulSoup(raw_data, 'html.parser')

    for ticker in currencies_id_cbrf:
        value = get_value_cbrf(currencies_id_cbrf[ticker])
        insert_to('staging', ticker, "RUB", value, today_date, "ЦБ РФ")
    insert_to('staging', "RUB", "RUB", 1, today_date, "ЦБ РФ")
    print('Добавлены данные о курсах за '+str_date)

except Exception as e:
    erlog("Произошло непредвиденное!")
    erlog(str(e))
    quit()
