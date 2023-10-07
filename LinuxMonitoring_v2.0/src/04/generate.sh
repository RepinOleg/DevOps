#!/bin/bash

generate_ip() {
    echo $(($RANDOM%256)).$(($RANDOM%256)).$(($RANDOM%256)).$(($RANDOM%256))
}

generate_code_answer() {
    codes=("200 OK" "201 CREATED" "400 BAD REQUEST" "401 UNAUTHORIZED" "403 FORBIDDEN" "404 NOT FOUND" "500 INTERNAL SERVER ERROR" "501 NOT EXTENDED" "502 BAD GATEWAY" "503 SERVICE UNAVAILABLE")
    echo ${codes[$((RANDOM%10))]}
}

# 200 OK Cвидетельствует о том, что обмен данными между клиентом и сервером прошли успешно
# 201 CREATED Информирует об успешном создании нового ресурса в результате выполнения запроса
# 400 Bad Request — Ошибка свидетельствует от том, что сервер не понял запрос пользователя из-за синтаксической ошибки
# 401 Unauthorized — Сообщает о необходимости быть авторизованным для получения запрашиваемого доступа
# 403 Forbidden — Запрет доступа к запрашиваемой странице
# 404 Not found - запрашиваемая страница не найдена
# 500 Internal Server Error — Код оповещает о возникшей внутренней ошибке сервера
# 501 Not Implemented — Сервер столкнулся с запросом, который не смог распознать
# 502 Bad Gateway — Сообщает о неправильном получении ответа вышестоящего сервера
# 503 Service Unavailable — Указывает на временную недоступность сервера

generate_methods() {
    methods=("GET" "POST" "PUT" "PATCH" "DELETE")
    echo ${methods[$((RANDOM%5))]}
}

generate_date() {
    echo $(date -d "$DAY days ago" +"%d/%b/%Y:%H:%M:%S %z")
}

generate_url() {
    echo "https://edu.21-school.ru/"$(($RANDOM%1000))
}

generate_agent() {
    agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
    echo ${agents[$((RANDOM%8))]}
}
