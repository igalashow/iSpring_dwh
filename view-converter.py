from datetime import datetime
import pymysql
import db_auth


def erlog(*args):
    """ Логирование ошибок """
    log = open("erlog.txt", 'a', encoding='windows-1251')
    print('Дата '+str(datetime.today())[:-10], file=log)
    print('view3-converter.py', file=log)
    print(*args, file=log)
    log.close()
    print(*args)


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
def get_table(table):
    """ Select всех данных из таблицы """
    query = 'SELECT * FROM ' + table
    return query


@connect_to_db
def insert_to(table):
    """ Инсертит данные в таблицу 6 столбцов"""
    query = 'INSERT INTO '+table+' VALUES (%s, %s, %s, %s, %s, %s, %s)'
    return query


def get_dict(table):
    """ Переносит справочники в словарь """
    tuple_ = get_table(table)
    dict_ = {}
    for item in tuple_:
        dict_.update([(item[0], item[1:])])
    return dict_


# try:
# Наполняем справочники
currencies = get_dict('currencies')
print(currencies)
source = get_dict('source')
print(source)

# Получаем данные из core
core = get_table('core')
print(core)


# Формируем view1
for row in core:
    curr_tuple1 = currencies[row[0]]
    curr_name1 = curr_tuple1[3]
    ticker1 = curr_tuple1[0]
    curr_tuple2 = currencies[row[1]]
    ticker2 = curr_tuple2[0]
    curr_name2 = curr_tuple2[3]
    ex_rate = row[2]
    date_rate = row[3]
    source_name = source[row[4]]
    insert_to('datamart1', curr_name1, ticker1, ticker2, curr_name2, ex_rate, date_rate, source_name)


# except Exception as e:
#     erlog("Произошло непредвиденное!")
#     erlog(str(e))
#     quit()