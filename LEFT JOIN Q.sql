USE sakila;

#1. . List all films, including those that have never been rented.

SELECT f.title, r.rental_id
FROM film f 
LEFT JOIN inventory i ON i.film_id = f.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
ORDER BY f.title;

#for null only
SELECT f.title, r.rental_id
FROM film f 
LEFT JOIN inventory i ON i.film_id = f.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

#2. Find all actors, including those who have not appeared in any film.

SELECT a.actor_id, a.first_name, a.last_name, fa.film_id
FROM actor a 
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
ORDER BY a.actor_id;

#for null 
SELECT a.actor_id, a.first_name, a.last_name, fa.film_id
FROM actor a 
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;

#3. List all categories, including those that have no associated films.

SELECT c.category_id, c.name AS category_name, fc.film_id
FROM category c
LEFT JOIN film_category fc ON fc.category_id = c.category_id
ORDER BY c.category_id;

SELECT c.category_id, c.name AS category_name, fc.film_id
FROM category c
LEFT JOIN film_category fc ON fc.category_id = c.category_id
WHERE fc.film_id IS NULL;

#4. Find all inventory items, including those that have never been rented.

SELECT i.inventory_id, i.film_id, i.store_id, f.title
FROM inventory i 
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.rental_id IS NULL;