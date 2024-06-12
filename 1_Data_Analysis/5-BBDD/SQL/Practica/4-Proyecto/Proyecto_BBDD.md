# Proyecto de Creación de Base de Datos Relacional

En este proyecto se creará una base de datos relacional a partir de los datos proporcionados. Los datos se refieren a un grupo de estudiantes de una escuela de bootcamps junto con el claustro de profesores. 

Este proyecto proporcionará experiencia en la creación de bases de datos relacionales a partir de unos datos de entrada sin normalizar, lo que es una habilidad fundamental en el campo de la gestión de datos y bases de datos.

### Equipos

Se realizarán por grupos mezclados de la vertical de Data Science y Full Stack, divididos en 4 grupos. Cada grupo deberá crear un repositorio de Github para subir el desarrollo final (el resto se podrá hacer un fork para tenerlo también en su perfil de Github).

### Datos de Entrada

Los datos de entrada tienen la siguiente estructura:

| Nombre              | Email                   | Promoción | Fecha_comienzo | Campus | Proyecto_HLF | Proyecto_EDA | Proyecto_BBDD | Proyecto_ML | Proyecto_Deployment |
|---------------------|-------------------------|-----------|----------------|--------|--------------|-------------|--------------|------------|--------------------|
| Jafet Casals        | Jafet_Casals@gmail.com  | Septiembre| 18/09/2023     | Madrid | Apto         | No Apto     | Apto         | Apto       | Apto               |
| Jorge Manzanares    | Jorge_Manzanares@gmail.com | Septiembre | 18/09/2023 | Madrid | Apto         | No Apto     | Apto         | Apto       | Apto               |
| ...                 | ...                     | ...       | ...            | ...    | ...          | ...         | ...          | ...        | ...                |

### Tareas a Realizar

1. **Normalización de Datos**: Analicen los datos y realicen una normalización adecuada para eliminar la redundancia y garantizar la integridad de los datos.

2. **Modelo Entidad-Relación (E/R)**: Diseñen un modelo E/R que represente la estructura de la base de datos normalizada. Definan las entidades, atributos y relaciones entre ellas.

3. **Modelo Lógico de la Base de Datos**: Con base en el modelo E/R, desarrollen un modelo lógico de la base de datos. Esto implica definir la estructura de las tablas y sus campos, así como las claves primarias y foráneas necesarias.

4. **Creación de la Base de Datos**: Utilizando un sistema de gestión de bases de datos de PostgreSQL, creen la base de datos y las tablas necesarias según el modelo lógico. Habrá que alojar en algún servidor vuestras bases de datos para poder acceder desde aplicaciones de terceros.
Algunos servicios gratis de postgreSQL:

- [ElephantSQL](https://www.elephantsql.com/)
- [Render](https://render.com/docs/databases)


Se deberá de tener en cuenta la escalabilidad de la base de datos. Es decir, tiene que ser capaz de poder crecer en campus (Madrid, Valencia,...), verticales (DS, FS,...), promociones (Septiembre, Febrero,...), Modalidad (Online, Presencial,...), aulas, etc...

### Entregables

- Diagrama del modelo Entidad-Relación (E/R).
- Diagrama del modelo lógico de la base de datos.
- Scripts SQL o comandos utilizados para crear la base de datos y las tablas.
- Base de datos funcional con los datos importados y consumibles con queries de consulta.


**Fecha entrega** : Viernes 14 de Marzo a las 9.00. Se realizará una presentación técnica (formato libre) por grupo del resultado final. Se deberá mostrar la base de datos ingestada según la solución propuesta.

