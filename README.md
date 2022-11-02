# Акиншев Дмитрий, 053501

Тема разрабатываемого проекта: **Аниметеатр AYAYAYA**.

## Описание предметной области

### Персонал
Данные персонала: уникальный идентификационный номер, ФИО, телефонный номер, электронная почта, должность, паспортные данные.

### Должности
Данные должности: уникальный идентификационный номер, название, зарплата.

### Билеты
Данные билета: уникальный идентификационный номер, цена, ряд, место, сеанс, наличие.

### Зал
Данные зала: уникальный идентификационный номер, название, вместимость. 

### Паспортные данные
Паспортные данные: уникальный идентификационный номер, дата рождения, пол, ИИН, адрес прописки.

### Аниме
Данные аниме: уникальный идентификационный номер, название, жанр, дата выхода, продолжительность.

### Жанр
Данные жанра: уникальный идентификационный номер, название, описание.

### Сеанс
Данные персонажа: уникальный идентификационный номер, аниме, зал, дата и время, персонал.

## Функциональные требования к проекту

1. Обязательные требования:
    - Авторизация пользователя.
    - Управление пользователями (CRUD).
    - Система ролей (Admin, Manager, Stuff).
    - Журналирование действий пользователя.
  
2. Функции создания записей и их изменения:
    - Создание и храние записей, содержащих информацию о сотрудниках. (Admin)
    - Создание и храние записей, содержащих информацию о билетах. (Admin, Manager, Stuff)
    - Создание и храние записей, содержащих информацию о должностях. (Admin)
    - Создание и храние записей, содержащих информацию о залах. (Admin, Manager)
    - Создание и храние записей, содержащих информацию о паспортных данных. (Admin)
    - Создание и храние записей, содержащих информацию об аниме. (Admin, Manager, Stuff)
    - Создание и храние записей, содержащих информацию о жанрах. (Admin, Manager, Stuff)
    - Создание и храние записей, содержащих информацию о сеансах. (Admin, Manager)

3. Пользователь должен иметь возможность получить из базы данных:
    - Количество купленных и оставшихся билетов на каждый сеанс.
    - Общую месячную зарплату персонала.
    - Вместимость залов.
    - Список аниме по жанрам.
    - Общую выручку за месяц.
    - Самые популярные аниме (по количеству проданных билетов).
    - Самые популярные жанры (по количеству проданных билетов).
    - Самые популярные аниме (по количеству выручки).
    - Самые популярные жанры (по количеству выручки).
    - Количество сеансов по каждому аниме.

# Дизайн базы данных

## Атрибуты сущностей

| Entity  | Attributes  |
|:------------- |:--------------- |
| Positions        | id, name, salary |
| Staff         | id, name (first_name, middle_name, last_name), tel, email, passport, position|
| Tickets       | id, price, row, place, session, availability|
| Hall   | id, name, capacity|
| Passport     | id, birth date, sex, residence address, IIN        |
| Anime | id, name, genre, release date, duration        |
| Genre          | id, name, description     |
| Session        | id, anime, hall, date, time, staff       |

## Информационная схема базы данных 

![DB](https://user-images.githubusercontent.com/73168415/199344985-f8135463-b5fc-441c-abfc-67ae51d644f3.jpeg)

