## Part 1. Готовый докер

* **Взять официальный докер образ с nginx и выкачать его при помощи docker pull**
* **Проверить наличие докер образа через docker images**
* **Запустить докер образ через docker run -d [image_id|repository]**
* **Проверить, что образ запустился через docker ps**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.1.png)

* **Посмотреть информацию о контейнере через docker inspect [container_id|container_name]**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.2.png)

* **По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера**

    *IP и Ports*

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.3.2.png)

    *Размер контейнера SizeRootFs*

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.3.3.png)

* **Остановить докер образ через docker stop [container_id|container_name]**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.4.png)

* **Проверить, что образ остановился через docker ps**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.5.png)

* **Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.6.png)

* **Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.7.png)

* **Перезапустить докер контейнер через docker restart [container_id|container_name]**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.8.png)

* **Проверить любым способом, что контейнер запустился**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/1.9.png)

## Part 2. Операции с контейнером

* **Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.1.png)

* **Создать на локальной машине файл nginx.conf**
* **Настроить в нем по пути /status отдачу страницы статуса сервера nginx**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.2.png)


* **Скопировать созданный файл nginx.conf внутрь докер образа через команду docker cp**
* **Перезапустить nginx внутри докер образа через команду exec**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.3.png)

* **Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.4.png)

* **Экспортировать контейнер в файл container.tar через команду export**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.4.1.png)

* **Остановить контейнер**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.5.png)

* **Удалить образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.6.png)

* **Удалить остановленный контейнер**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.7.png)

* **Импортировать контейнер обратно через команду import**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.8.png)

* **Запустить импортированный контейнер**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.8.1.png)

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.8.2.png)

* **Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/2.9.png)

## Part 3. Мини веб-сервер

* **Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/3.1.png)

* **Запустить написанный мини сервер через spawn-fcgi на порту 8080**

    *gcc main.c -lfcgi -o server*

    *spawn-fcgi -p 8080 server*

* **Написать свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/3.2.png)

* **Проверить, что в браузере по localhost:81 отдается написанная вами страничка**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/3.3.png)

* **Положить файл nginx.conf по пути ./nginx/nginx.conf (это понадобится позже)**

    mv nginx.conf ./nginx/nginx.conf

## Part 4. Свой докер
Теперь всё готово. Можно приступать к написанию докер образа для созданного сервера.

* **Написать свой докер образ, который:**

1) собирает исходники мини сервера на FastCgi из Части 3


2) запускает его на 8080 порту

3) копирует внутрь образа написанный ./nginx/nginx.conf

4) запускает nginx.

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/4.1.png)

* **Собрать написанный докер образ через docker build при этом указав имя и тег**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/4.2.png)

* **Проверить через docker images, что все собралось корректно**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/4.3.png)

* **Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а (см. Часть 2)**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/4.4.png)

* **Проверить, что по localhost:80 доступна страничка написанного мини сервера**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/4.4.1.png)

* **Дописать в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx. Перезапустить докер образ**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/4.2.2.png)

* **Если всё сделано верно, то, после сохранения файла и перезапуска контейнера, конфигурационный файл внутри докер образа должен обновиться самостоятельно без лишних действий**

* **Проверить, что теперь по localhost:80/status отдается страничка со статусом nginx**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/4.5.png)

## Part 5. Dockle

После написания образа никогда не будет лишним проверить его на безопасность.

* **Просканировать образ из предыдущего задания через dockle [image_id|repository]**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/5.1.png)

* **Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/5.2.png)

## Part 6. Базовый Docker Compose

* **Написать файл docker-compose.yml, с помощью которого:**

1) Поднять докер контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину)


2) Поднять докер контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера

* **Замапить 8080 порт второго контейнера на 80 порт локальной машины**

* **Остановить все запущенные контейнеры**

* **Собрать и запустить проект с помощью команд docker-compose build и docker-compose up**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/6.1.png)

* **Проверить, что в браузере по localhost:80 отдается написанная вами страничка, как и ранее**

    ![](https://github.com/RepinOleg/DevOps/blob/develop/Docker/src/Images/6.2.png)



