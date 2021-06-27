import pymysql
import db_auth


def get_dict(table):
    """ Переносит справочники в словарь """
    tuple = get_table(table)
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
def get_table(table):
    """ Select всех данных из таблицы """
    query = 'SELECT * FROM '+ table
    return query

@connect_to_db
def insert_to_core(core):
    """ Инсертит данные в таблицу Core """
    query = 'INSERT INTO '+core+' VALUES (%s, %s, %s, %s, %s)'
    return query



# Наполняем справочники
currencies = get_dict('currencies')
source = get_dict('source')

# Получаем данные из staging
staging = get_table('staging')

# Формируем Core
for row in staging:
    curr_id1 = currencies[row[0]]
    curr_id2 = currencies[row[1]]
    source_id = source[row[4]]
    ex_rate = row[2]
    insert_to_core('core', curr_id1[0], curr_id2[0], ex_rate, row[3], source_id)

cleaning_table('staging')


