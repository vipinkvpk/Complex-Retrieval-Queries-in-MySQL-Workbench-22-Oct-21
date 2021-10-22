select firstname, lastname, invoice.invoiceid, invoicedate, total, trackid, unitprice, quantity
from invoice,customer,invoiceline
where billingcountry = 'USA' 
and invoice.customerid = customer.customerid 
and invoice.invoiceId = invoiceline.invoiceId
order by lastname, invoice.invoiceid, trackid


select name, title
from artist left join album
on artist.artistid = album.ArtistId
order by name, title


select billingcountry, count(*)
from invoice
group by billingcountry


select customerid, sum(total) as 'TotalSale',
	max(total) as 'Largest Invoice Amount',
	min(total) as 'smallest Invoice Amount',
	avg(total) as 'Average Invoice Amount'
from invoice
group by customerid
order by customerid


select invoiceid, total
from invoice
where total > 
(select avg(total)
from invoice)


select lastname, firstname
from customer
where customerid in 
(select customerid from invoice
where total >
(select avg(total) from invoice))



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
order by artist.artistid, title;


--
-- Sales Invoice details for orders of more than 10 tracks
--
select invoicedate, invoice.invoiceid,
    LastName, FirstName,  
    artist.name as 'Artist',
    album.title as 'Album', 
    track.name as 'Track',
    quantity, invoiceline.unitprice,
    (quantity * invoiceline. unitprice) as 'extended price'
from invoice, customer, invoiceline, track, album, artist
where invoice.customerid = customer.customerid
  and invoice.InvoiceId = invoiceline.InvoiceId
  and invoiceline.TrackId = track.TrackId 
  and track.AlbumId = album.albumid
  and album.ArtistId = artist.artistid
  and invoice.invoiceid in
      (select invoiceid 
		from invoiceline
		group by invoiceline.invoiceid
		having count(*) > 10)
 order by invoicedate desc, invoice.invoiceid ; 

--
-- Albums and Tracks by Playlist
--
SELECT playlist.name as 'Playlist',
  album.title as 'Album', 
  track.name as 'Track'
from album join track
  on album.albumid = track.albumid
  join playlisttrack
  on track.TrackId = playlisttrack.TrackId
  join playlist
  on playlist.PlaylistId = playlisttrack.playlistid
  order by playlist.name, album.title;
--
-- List artists and albums
--
select name as 'Artist', 
      title as 'Album'
from artist join album
on artist.artistid = album.artistid
order by name, title;


--
-- Sales Invoice details for orders of more than 10 tracks
--
select invoicedate, invoice.invoiceid,
    LastName, FirstName,  
    artist.name as 'Artist',
    album.title as 'Album', 
    track.name as 'Track',
    quantity, invoiceline.unitprice,
    (quantity * invoiceline. unitprice) as 'extended price'
from invoice, customer, invoiceline, track, album, artist
where invoice.customerid = customer.customerid
  and invoice.InvoiceId = invoiceline.InvoiceId
  and invoiceline.TrackId = track.TrackId 
  and track.AlbumId = album.albumid
  and album.ArtistId = artist.artistid
  and invoice.invoiceid in
      (select invoiceid 
		from invoiceline
		group by invoiceline.invoiceid
		having count(*) > 10)
 order by invoicedate desc, invoice.invoiceid ; 

--
-- Albums and Tracks by Playlist
--
SELECT playlist.name as 'Playlist',
  album.title as 'Album', 
  track.name as 'Track'
from album join track
  on album.albumid = track.albumid
  join playlisttrack
  on track.TrackId = playlisttrack.TrackId
  join playlist
  on playlist.PlaylistId = playlisttrack.playlistid
  order by playlist.name, album.title;
--
-- List artists and albums
--
select name as 'Artist', 
      title as 'Album'
from artist join album
on artist.artistid = album.artistid
order by name, title;


-- List Customer Names

select lastname, firstname
from customer;


--
-- Sales Invoice details for orders of more than 10 tracks
--
select invoicedate, invoice.invoiceid,
    LastName, FirstName,  
    artist.name as 'Artist',
    album.title as 'Album', 
    track.name as 'Track',
    quantity, invoiceline.unitprice,
    (quantity * invoiceline. unitprice) as 'extended price'
from invoice, customer, invoiceline, track, album, artist
where invoice.customerid = customer.customerid
  and invoice.InvoiceId = invoiceline.InvoiceId
  and invoiceline.TrackId = track.TrackId 
  and track.AlbumId = album.albumid
  and album.ArtistId = artist.artistid
  and invoice.invoiceid in
      (select invoiceid 
		from invoiceline
		group by invoiceline.invoiceid
		having count(*) > 10)
 order by invoicedate desc, invoice.invoiceid ; 

--
-- Albums and Tracks by Playlist
--
SELECT playlist.name as 'Playlist',
  album.title as 'Album', 
  track.name as 'Track'
from album join track
  on album.albumid = track.albumid
  join playlisttrack
  on track.TrackId = playlisttrack.TrackId
  join playlist
  on playlist.PlaylistId = playlisttrack.playlistid
  order by playlist.name, album.title;
--
-- List artists and albums
--
select name as 'Artist', 
      title as 'Album'
from artist join album
on artist.artistid = album.artistid
order by name, title;


-- List Customer Names

select lastname, firstname
from customer;


select genre.Name, count(*)
from genre join track
on genre.GenreId = track.GenreId
group by genre.name


select * from genre


select * from track


select * from track
where genreid = 5



