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

-- 2) Quiero ver las peliculas en las que actua 




