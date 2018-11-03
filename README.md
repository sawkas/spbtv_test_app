# Тестовое задание для Spbtv

## Tech
* Ruby 2.5.1
* Sinatra 2.0.4

## Setup
* ```git clone```
* ```bundle install```
* ```cp .env.example .env```
в .env можно указать адаптер ```DATA_SERVICE``` для хранения данных: в редисе ```redis``` или в памяти приложения ```hash```
* ```rackup -p 3000```

## Usage
Прием от клиентов уведомления о том, что клиент смотрит видео
```
curl -X POST -H "Content-type: application/json" --data '{"customer_id": "customer_id_1", "video_id": "video_id_1"}' localhost:3000/watch_stream
```
Отвечает на запрос, сколько видео потоков смотрит пользователь в данный момент
```
curl -X GET -H "Content-type: application/json" localhost:3000/videos_count/customer_id_1
```
Отвечает на вопрос, сколько пользователей смотрят данное видео в текущий момент
```
curl -X GET -H "Content-type: application/json" localhost:3000/customers_count/video_id_1
```

## About
Информация о том, что клиент смотрит видео хранится в таком виде
```
{
  unix_time_string: [
    "#{customer_id}#{separator}#{video_id}"
  ]
}
```
Пример
```
{
  "1541254562": [
    "customer_id_1%:%video_id_1",
    "customer_id_1%:%video_id_2",
    "customer_id_2%:%video_id_1"
  ],
  "1541254563": [
    "customer_id_1%:%video_id_2",
    "customer_id_2%:%video_id_1",
    "customer_id_2%:%video_id_3"
  ]
}
```

## Troubleshooting
При запуске с адаптером hash данные хранятся в памяти приложения и не удаляются.
В этом случае при большом кол-ве запросов будет использоваться много RAM для хранения неактуальных данных.
Варианты решения:
* реализовать механизм очистки неактуальных данных

## TODO
* покрыть тестами
* провести нагрузочное тестирование

## P.S.
Мой первый опыт использования Sinatra
