-- Active: 1747551965111@@127.0.0.1@5433@conservation_db@public
-- Active: 1747551965111@@127.0.0.1@5433@conservation_db
create table rangers (
	ranger_id serial primary key,
	name varchar(100),
	region text
);

insert into rangers (ranger_id, name, region) values
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

create table species (
    species_id serial primary key,
    common_name varchar(50),
    scientific_name varchar(100),
    discovery_date DATE,
    conservation_status varchar(20) check(conservation_status in ('Endangered','Vulnerable'))
);

-- Ended up dropping the constraint so I had to add the new one back
alter table species add constraint species_conservation_status_check check (conservation_status IN ('Endangered', 'Vulnerable', 'Historic'));

insert into species (species_id, common_name, scientific_name, discovery_date, conservation_status) values
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


create table sightings (
    sighting_id serial primary key,
    ranger_id integer references rangers(ranger_id),
    species_id integer references species(species_id),
    sighting_time timestamp,
    location text,
    notes text
);
insert into sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) values
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', null);

-- 1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
insert into rangers (ranger_id, name, region) values (4,'Derek Fox','Coastal Plains');

-- 2️⃣ Count unique species ever sighted.
select count(distinct(species_id)) as unique_species_count from sightings;

-- 3️⃣ Find all sightings where the location includes "Pass".
select * from sightings where location like '%Pass%';

-- 4️⃣ List each ranger's name and their total number of sightings.
select  r.name as name, count(*) as total_sightings from rangers r inner join sightings s on r.ranger_id = s.ranger_id group by r.name ;

-- 5️⃣ List species that have never been sighted.
select common_name from species sp where not exists (select 1 from sightings si where si.species_id = sp.species_id );

-- 6️⃣ Show the most recent 2 sightings.
select sp.common_name, si.sighting_time, r.name from sightings si join rangers r on si.ranger_id = r.ranger_id join species sp on si.species_id = sp.species_id order by si.sighting_time desc limit 2;

-- 7️⃣ Update all species discovered before year 1800 to have status 'Historic'.
update species set conservation_status = 'Historic' where extract('year' from discovery_date) < 1800;

-- 8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
select sighting_id,
case
    when sighting_time::time < '12:00:00' then 'Morning'
    when sighting_time::time between '12:00:00' and '17:00:00' then 'Afternoon'
    when sighting_time::time > '17:00:00' then 'Evening'
end as time_of_day from sightings;

-- 9️⃣ Delete rangers who have never sighted any species
delete from rangers r where not exists (select 1 from sightings si where si.ranger_id = r.ranger_id);


