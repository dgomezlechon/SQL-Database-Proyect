-- 1) Primero quiero ver que película se ha alquilado más:

select title, count(rental_id) as Count
from rental 
left join inventory as inv
on inv.inventory_id=rental.inventory_id
left join film
on film.film_id=inv.film_id
group by title
order by Count desc limit 3; 
-- la película más alquilada es "Campus remember" que se ha alquilado un totla de 15 veces

-- 2) Quiero ver las peliculas de Action:

select  title,name
from old_hdd as old
left join category as cat
on cat.category_id=old.category_id
where name='Action';

-- 3) Quiero ver las peliculas de Action en las que aparece el actor ZERO CAGE :

select  title,name,`full name`
from old_hdd as old
left join category as cat
on cat.category_id=old.category_id
where name='Action' and `full name`='ZERO CAGE';

-- 4)  Que idioma es el más utilizado en las películas:

select name, count(film_id) 
from film 
left join language as lan
on lan.language_id=film.language_id
group by name;
-- todas son en inglés


-- 5) Que tipo de pelicula suele hacer más Penelope Guiness:

select count(`full name`) as total,name
from old_hdd as o
left join category as cat
on o.category_id=cat.category_id
where `full name`='PENELOPE GUINESS'
group by name
order by  total desc;
-- el tipo de película que más hace Penelope es de horror

-- 6) Que cliente ha alquilado más películas (con subquery)

select rental.inventory_id,count(title) as total,customer_id
from (select inventory_id,title
from inventory as inv
left join film as f
on f.film_id=inv.film_id) as invent
right join rental
on rental.inventory_id=invent.inventory_id
group by customer_id
order by total desc;

-- el cliente 197 ha alquilado 8 películas (el que más)

-- 7) Que miembro del staff consigue alquilar más:

select staff_id,count(title)
from (select inventory_id,title
from inventory as inv
left join film as f
on f.film_id=inv.film_id) as invent
right join rental
on rental.inventory_id=invent.inventory_id
group by staff_id;



 












