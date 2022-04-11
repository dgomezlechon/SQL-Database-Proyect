# W4 Project - Building mySQL Data-base 

## Exploración de los datos

Exploramos las distintas tablas, viendo tanto las columnas que hay para entender el ocntenido y establecer las distintas relaciones entre tablas como el tipo de datos como si hay nulos o no.

Después de explorar las tablas vemos que es un negocio de alquiler de películas.

Por un lado tenemos la tabla rental_csv que es como si fueran los invoices, es decir para cada película que se alquila tenemos la información sobre esa operación. Esta tabla se relaciona por un lado a inventory_csv por el inventory_id ya que tenemos que saber que cinta particular de nuestro stock se ha alquilado. De la misma manera, el inventory_csv esta unido a film_csv por el film_id ya que tenemos que saber a que título de película corresponde la cinta que estamos alquilando.

También tenemos relación entrar film_csv y language_csv >> están relacionadas por el language_id ya que tenemos que saber en que lenguaje está la película.

Finalmente tenemos otra tabla llamada old_hdd_csv que une por un lado con la tabla category_csv a través del category_id, por otro lado con la tabla film_csv a través de title y con actor_csv a través de name y first_name.


# Limpieza de Datos

Hemos visto que solo hay nulos en el film_csv en la columna original_language_id que es toda nula, por lo que vamos a eliminar la columna directamente

Comprobamos que no haya duplicados en las tablas para eliminar datos que se repitan.
Las columnas last_update entiendo que hacen referencia a la última vez que se actualizó la base de datos por lo que no me van a ofrecer información relevante, así que las elimino.


## Unión film_csv y old_hdd_csv

Estas dos columnas están relacionadas for "title". El problema es que si comparamos, en old_hdd_csv no están incluidos todos los títulos de film_csv

El full_name del actor no lo sabemos para las películas que no están incluidas en old_hdd_csv por lo uqe rellenamos con unknown.
Nos falta añadir el category_id de las peliculas que faltan, no tenemos la información por lo que vamos a ponerle categoria 0
Luego unimos las Dataframes old_hdd_csv y frame_to_join

## Editamos el inventory_id

Como el inventory_id en la tabla inventory va solo del 1-1000 y en la tabla rental tenemos una gran parte de inventories superiores a 1000, no podriamos trabajar con los inventory ids con la mayoria de películas. Entonces para poder trabajar bien, vamos a sustituir los valores de la columna inventory_id de la dataframe rental_csv por valores random entre el 1-1000.


# Subida de Datos
Subimos los datos a la SQL a través del workbench utilizando el reverse engineering y estableciendo las primary y foreign keys.


# BONUS

Importamos un csv con las coordenadas en las que fue la premiere de cada una de las películas.
Importamos otros dos csv, uno con las coordenadas donde viven los clientes y otro con las coordenadas donde está la tienda.
Las plasmamos en mapas distintos y las subimos a la base de datos a traves de Alchemy.
