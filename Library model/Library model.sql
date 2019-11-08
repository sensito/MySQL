CREATE DATABASE IF NOT EXISTS library; #Crea la libreria si es que no exite
use library; #uso de la libreria


#UNSIGNED Quita el bit del signo y lo da para un valor mas
#NOT NULL el valor no puede ser nulo
#AUTO_INCREMENT incrementa automaticamente de uno en uno el valor de la tabla
#INTEGER Es casi lo mismo que poner solo INT
#ENUM la base de datos solo permitira el ingreso especifico de los balores que lo soigen entre parentesis
#COMMENT La DB permirira que coloques comentarios a las tablas que solo podra ber el admin de esta misma
#UNIQUE la DB validara que dentro de ese campo solo exista uno y solo un valor, para que todos sean diferentes
#DEFAULT LA DB si resive un valor vacio, le pondra automaticamente el valor puesto por default
#DATETIME permitira el ingreso de valores "DD-MM-A~NO,A~NO"
#TIMESTAMP permite el ingreso de valores como "DD-MM-A~NO,A~NO  HH:MM:SS"
#VARCHAR la manera mas rapida y comoda de identificar un string
#TEXT es una tipo de dato sin ta~no es de tama~no dependiendo de los caracteres que le ingreses
#La nuevas mejores practicas dicatan que es mejor poner todas las funciones del lenguaje en mayusculas y los nombre de tablas etc en minuscilas
#Todos los nombres de tablas etc en ingles
#todos los nombres de las columnas en prural
#las bareiables ID en singular el nombre de la tabla segido por,  _id


CREATE TABLE IF NOT EXISTS editorials(
  editorial_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL  #Primer parte diferente, las '' o los ''  se utilisan para espeficar que es el nombre de un atributo y no una funcion del lengiaje
)CHARSET=utf8mb4; #Se utilisa para que dentro de la base de datos se puedan introdusir asentos o ~n e inclusive emogis xD

CREATE TABLE IF NOT EXISTS genres(
  genre_id INTEGER UNSIGNED PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  literary_genres VARCHAR(30) NOT NULL UNIQUE
)CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS authors (
  author_id  INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100)
)CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS type_persons(
  `type_person_id` INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `type` ENUM('est', 'prof', 'limp', 'otros') NOT NULL COMMENT 'est = etudiante, prof = profesor, limp = limpieza, et al = otros'
)CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS books (
	book_id INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	author_id INTEGER UNSIGNED NOT NULL,
  editorial_id INTEGER UNSIGNED NOT NULL,
	`title` VARCHAR(100) NOT NULL,
	`year` INTEGER NOT NULL DEFAULT '1900',
	`lenguage` VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Languje', #esta norma ISO solo es para guardar lenguajes a 2 dijitos
  `copies` INTEGER NOT NULL DEFAULT '1',
  `genre_id` INTEGER UNSIGNED NOT NULL,
	`description` TEXT,
  FOREIGN KEY (editorial_id) REFERENCES editorials(editorial_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
)CHARSET=utf8mb4;

create table relAuthorsBooks(
	relAutorsBooks_id INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  author_id INTEGER UNSIGNED NOT NULL,
  book_id INTEGER UNSIGNED NOT NULL,
  foreign key (author_id) references authors(author_id),
  foreign key (book_id) references books(book_id)
);



  	CREATE TABLE IF NOT EXISTS persons(
  		person_id INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  		`name` varchar(50) NOT NULL,
  		`gender` ENUM('M','F','NP') NOT NULL,
  		email varchar(100) NOT NULL UNIQUE,
      `cell_phone_number` VARCHAR(15) UNIQUE,
  		birthdate DATETIME,
      type_person_id INTEGER UNSIGNED NOT NULL,
  		`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  		`update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  		`active` TINYINT(1) NOT NULL DEFAULT '1',
      FOREIGN KEY (type_person_id) REFERENCES type_persons(type_person_id)

  	)CHARSET=utf8mb4;

	CREATE TABLE IF NOT EXISTS loans(
		loan_id INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
		book_id INTEGER UNSIGNED NOT NULL,
		person_id INTEGER UNSIGNED NOT NULL,
    librarian_id INTEGER UNSIGNED NOT NULL,
		`operation_type` ENUM('BORROWD','RETURNED') NOT NULL,
		`create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
		`update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		`delivered` TINYINT(1) NOT NULL DEFAULT '0',
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (person_id) REFERENCES persons(person_id),
    FOREIGN KEY (librarian_id) REFERENCES persons(person_id)
	)CHARSET=utf8mb4;
