Firebase
-------------------------------------------------------------------------------
Shows how to implement an ICollectionView class based on Firebase databases.

Firebase is a powerful API to store and sync data in real time (https://www.firebase.com/).

The FirebaseCollectionView class in this sample extends the CollectionView class
in Wijmo to connect to Firebase tables. The FirebaseCollectionView class loads
data from Firebase tables. When the user modifies the view, changes are automatically
applied to the Firebase table.

You can use FirebaseCollectionView objects as data sources for any Wijmo controls,
and in addition to full CRUD support and real-time updates you automatically get 
CollectionView features including sorting, filtering, paging, and grouping. 

Note: this sample uses a live Firebase data store that contains the traditional
NorthWind database. You can see and edit the database using the Firebase admin
console at this url: https://Firebase.firebaseIO-demo.com/Northwind/.
