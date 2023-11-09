# Senda
![logo senda](https://github.com/Los-traicionados/senda/assets/99487654/35838cfa-285f-442a-8370-54e4f332b677)

Senda es una agencia de viajes que se especializa en crear experiencias únicas y personalizadas para sus clientes. Con un enfoque en destinos exóticos y aventuras inolvidables, Senda se esfuerza por proporcionar viajes excepcionales y memorables que inspiren y enriquezcan la vida de cada viajero.

## Tabla de Contenidos

1. [Instalación](#instalación)
2. [Uso](#uso)

## Instalación

### Requisitos Previos
-   Tener instalado python en su version 3 (3.7 a 3.10).
-   Tener un administrador de base de datos, en nuestro caso XAMPP
### Creacion de la base de datos:
-   Levantamos los servicios necesarios
<img width="auto" alt="XAMPP" src="https://github.com/Los-traicionados/senda/assets/99487654/5fcd84d9-6e26-4b50-9bbd-77eea06c524f">

-   Abrimos nuestro administrador de base de datos XAMPP
-   Creamos una base de datos con el nombre de `db_senda`
  <img width="auto" alt="Crear base de datos" src="https://github.com/Los-traicionados/senda/assets/99487654/dbbaf3e9-1ae0-46eb-a431-58b67f2e9280">


### Para levantar los servicios dentro de nustro localhost
1. Clona el repositorio: `git clone https://github.com/Los-traicionados/senda.git`
2. Ve al directorio del proyecto: `cd senda`
3. Crea un entorno virtual: `python3 -m venv venv`
4. Activa el entorno virtual:
   - En Windows: `venv\Scripts\activate`
   - En macOS y Linux: `source venv/bin/activate`
5. Instala las dependencias: `pip install -r requirements.txt`
6. Generar las migraciones de la base de datos: `python manage.py makemigrations`
7. Realiza las migraciones de la base de datos: `python manage.py migrate`
8. Inicia el servidor: `python manage.py runserver`

Cuando sigues estos pasos, tendrás la base de datos creada y si entras dentro de tu navegador a: `127.0.0.1:8000`, podras ver ya el proyecto.
<img width="auto" alt="Runserver" src="https://github.com/Los-traicionados/senda/assets/99487654/71d46fee-39d9-460c-9bb1-74c20a56661e">


### Para agregar los datos por defecto
- Abres el archivo `db_senda.sql`
- Copias todo el contenido en la seccion de SQL del administrador de base de datos
 <img width="auto" alt="Sql" src="https://github.com/Los-traicionados/senda/assets/99487654/86865ad3-d588-4ed7-879a-d2067b896eba">
- Desmarcas la verificacion de claves foraneas, ejecutas y listo.
<img width="auto" alt="SQL ejeutado" src="https://github.com/Los-traicionados/senda/assets/99487654/67347d95-4dad-4cca-be42-5a1f8561f334">
