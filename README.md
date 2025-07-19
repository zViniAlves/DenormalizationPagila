![Built with Python & SQL](https://img.shields.io/badge/built%20with-Python-blue)
![SQL](https://img.shields.io/badge/SQL-yellow)
![Spark](https://img.shields.io/badge/Spark-orange)
![Linux](https://img.shields.io/badge/made_for-Linux-FF8A00)
![Study](https://img.shields.io/badge/project-learning-0D9901)

# Denormalization Pagila
Demonstration of schema denormalization techniques aimed at improving performance for analytical workloads.

## Quickstart
The first step is to configure the .env file, which contains the database connection settings. If PostgreSQL is not installed on your machine, use the default host (localhost) and port (5432) typically used by PostgreSQL. <br><br>
Next, execute the [`config_pagila.sh`](config_pagila.sh) script, which will install PostgreSQL if it's missing and configure the database schemas and populate them with data.
```
./config_pagila.sh
```
Once Pagila is installed, you can explore the database using any PostgreSQL-compatible GUI (e.g., DBeaver or pgAdmin). After that, set up the virtual enviroment and execute the project by running the [`run.py`](run.py) script.
> [!Caution]
> You need to have spark installed with the Postgres jar to run the project correctly
