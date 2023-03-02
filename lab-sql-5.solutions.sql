use sakila;

# 1.Drop column picture from staff.
alter table staff drop column picture; 

# 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff (first_name,last_name,store_id,address_id,username,email,inventory_id) values ('Tammy','Sanders', 2,79,'Tammy','tammy.sanders@sakilastaff.com'),

# 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
# You can use current date for the rental_date column in the rental table. 
# Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
# For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

# Use similar method to get inventory_id, film_id, and staff_id.

create table rental1 select * from rental;
INSERT INTO rental1(rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
values('2023-02-15 21:30:53',8,130,'2023-02-17 21:30:53',1,'2023-02-18 21:30:53');

select inventory_id from inventory where film_id = 130;
select customer_id from customer where first_name = 'CHARLOTTE' AND last_name = 'HUNTER';
select staff_id from sakila.STAFF where first_name = 'Mike' AND last_name = 'Hillyer';

drop table rental1;

# Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
#Check if there are any non-active users
#Create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer

create table deleted_users as select * from customer;
select* from deleted_users;
select distinct(active) from deleted_users; # inactive value is 0
show variables like 'sql_safe_updates';
set sql_safe_updates = 0;
delete from deleted_users where active=0;
select* from deleted_users where active=0;


