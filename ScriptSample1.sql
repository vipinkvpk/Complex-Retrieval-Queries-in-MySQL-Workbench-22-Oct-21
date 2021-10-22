--
-- List the albums
--
select * from album;
--
-- List the artists
--
select * from artist;
--
-- List artists and albums
--
select name, title
from artist left join album
on artist.artistid = album.artistid
order by artist, title;
