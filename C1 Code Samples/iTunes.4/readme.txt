ASP.NET iTunes 4.x
-------------------------------------------------------------------------------
An iTunes like sample that demonstrates a variety of useful techniques to create a rich UX.

iTunes web app is built using several ComponentOne ASP.NET Wijmo controls, jQuery, 
Entity Data Model, ADO.NET Data Services, and CSS. It demonstrates a balance 
between server side and client side development flavors. The sample is not 
complete, but showcases some useful techniques in accessing data and working with 
in on the client-side. 

This sample starts with a SQL Compact Database of an iTunes song library. It then 
creates a ADO.NET Entity Framework Data Model from the Database. The Default.aspx 
page renders this data in a Menu that lists all Playlist objects from the Model. 
Then a GridView displays all Track object for a selected Playlist. Each control 
is databound using ObjectDataSource. 

The sample also demonstrates client-side data access by surfacing it in an ADO.NET 
WCF Service. It then calls the service using jQuery to get Track information when 
a Track is double-clicked in the GridView. Drag and drop is also added to each 
Track in the GridView to allow Tracks to be added to playlists. The Tracks do not 
actually get added to the playlist, but it is simulated using jQuery. 