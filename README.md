# ft_server

To build image run:
docker build -t NAME . \\ (insteed of NAME put how you call the image)

After building run:
docker run -it -p 80:80 -p 443:443 NAME

Проект по запуску небольшого серверного приложения на Docker.
Есть доступ к просмотру страничку на WordPress,
а также возможность заполнять и брать данные из БД (MariaDB)
