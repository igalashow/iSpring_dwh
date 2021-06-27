from datetime import date, timedelta
import time
import pymysql
import db_auth


def get_dict(table):
    """ Переносит справочники в словарь """
    tuple = get_handbook(table)
    dict_ = {}
    for item in tuple:
        dict_.update([(item[0], item[1:])])
    return dict_

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
        mycursor.execute(query, args[1:])
        dwh.commit()
        dwh.close()
        return mycursor.fetchall()
    return wrapper


@connect_to_db
def cleaning_table(table):
    """ Очистка таблицы """
    query = 'TRUNCATE TABLE '+ table
    return query


@connect_to_db
def get_handbook(table):
    """ Select данных из справочника """
    query = 'SELECT * FROM '+ table
    return query

# Наполняем справочники
currencies = get_dict('currencies')

source = get_dict('source')

