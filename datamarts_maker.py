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


def get_dict(table):
    """ Переносит справочники в словарь """
    tuple_ = get_table(table)
    dict_ = {}
    for item in tuple_:
        dict_.update([(item[0], item[1:])])
    return dict_


def make_all_to_all(day_list):
    """ Пересчитывает курсы все-ко-всем """
    curr_list = [row[0] for row in day_list]
    all_to_all = []
    for curr in curr_list:
        mult = [row[2] for row in day_list if row[0] == curr]
        for row in day_list:
            all_to_all.append((row[0], curr, row[2]/mult[0], row[3], row[4]))
    return all_to_all


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
def get_table(table):
    """ Select всех данных из таблицы """
    query = 'SELECT * FROM ' + table
    return query


@connect_to_db
def insert_to(table):
    """ Инсертит данные в таблицу """
    query = 'INSERT INTO '+table+' VALUES ('
    return query



# try:
# Наполняем справочники
currencies = get_dict('currencies')
source = get_dict('source')

# Получаем данные из core
core = get_table('core')


# Формируем datamart1
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


# Формируем дневные листы котировок для пересчета все-ко-всем, пересчитываем и собираем в общий словарь all_to_all
all_to_all = []
reference_date = core[0][3]
day_list = []
for roww in core:
    if roww[3] == reference_date:
        day_list.append(roww)
    else:
        all_to_all = all_to_all + make_all_to_all(day_list)
        reference_date = roww[3]
        day_list = []
        day_list.append(roww)
all_to_all = all_to_all + make_all_to_all(day_list)

# Формируем таблицу all_to_all
for row in all_to_all:
    insert_to('all_to_all', row[0], row[1], row[2], row[3], row[4])


# Формируем datamart2
for row in all_to_all:
    if row[1] == '840':  # код USD
        curr_tuple1 = currencies[row[0]]
        curr_name1 = curr_tuple1[1]
        ticker1 = curr_tuple1[0]
        curr_tuple2 = currencies[row[1]]
        ticker2 = curr_tuple2[0]
        curr_name2 = curr_tuple2[1]
        ex_rate = row[2]
        date_rate = row[3]
        source_name = source[row[4]]
        insert_to('datamart2', curr_name1, ticker1, ticker2, curr_name2, ex_rate, date_rate, source_name)


# except Exception as e:
#     erlog("Произошло непредвиденное!")
#     erlog(str(e))
#     quit()