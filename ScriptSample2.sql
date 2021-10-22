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