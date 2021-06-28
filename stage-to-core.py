from datetime import datetime
import pymysql
import db_auth


def erlog(*args):
    """ Логирование ошибок """
    log = open("erlog.txt", 'a', encoding='windows-1251')
    print('Дата '+str(datetime.today())[:-10], file=log)
    print('stage-to-core.py', file=log)
    print(*args, file=log)
    log.close()
    print(*args)


def get_dict(table):
    """ Переносит справочники в словарь """
    tuple_ = get_table(table)
    dict_ = {}
    for item in tuple_:
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
    query = 'TRUNCATE TABLE ' + table
    return query


@connect_to_db
def get_table(table):
    """ Select всех данных из таблицы """
    query = 'SELECT * FROM ' + table
    return query


@connect_to_db
def insert_to_table(table):
    """ Инсертит данные в таблицу """
    query = 'INSERT INTO '+table+' VALUES (%s, %s, %s, %s, %s)'
    return query

try:
    # Наполняем справочники
    currencies = get_dict('currencies')
    source = get_dict('source')

    # Получаем данные из staging
    staging = get_table('staging')

    # Формируем Core
    for row in staging:
        curr_id1 = [key for key, value in currencies.items() if row[0] in value]
        curr_id2 = [key for key, value in currencies.items() if row[1] in value]
        ex_rate = row[2]
        date_mark = row[3]
        source_id = [key for key, value in source.items() if row[4] in value]

        insert_to_table('core', curr_id1[0], curr_id2[0], ex_rate, date_mark, source_id)

        cleaning_table('staging')

except Exception as e:
    erlog("Произошло непредвиденное!")
    erlog(str(e))
    quit()