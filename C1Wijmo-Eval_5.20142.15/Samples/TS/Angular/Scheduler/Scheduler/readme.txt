Scheduler
------------------------------------------------------------
Appointment scheduler application using Wijmo 5 and Firebase.

The application shows a calendar to allow users to schedule appointments.

The appointments are stored in a Firebase database, so the application can 
track availability and prevent users from scheduling appointments at the 
same time.

The interesting thing about this sample is that the updates are done in 
real time. So if another user makes or cancels appointments while you
are using the app, your view of the calendar and slots will be updated
automatically.

The application shows how to customize the appearance of cells in the 
Wijmo Calendar, how to authenticate users with Firebase open authentication, and 
how to handle real-time database updates with a FirebaseCollectionView class.

The application design was inspired by ClickBook (https://www.clickbook.net).
