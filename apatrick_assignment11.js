//  Assignment11.js
//  MondoDB Extra Credit 
//  Andrew Patrick
//  CS 150A, Fall 2021 */

// Question 01 : Set the db object to the database named library.
use library


// Question 02 : Create a new document in the user collection.
// The document should satisfy the given requirements.

coll = db.getCollection("user")
coll.insert({
    "display" : "Rachel Cunningham",
    "fname" : "rachel",
    "lname" : "cunningham",
    "type" : "student",
    "age" : 24,
})


// Question 03 : Write a query to retrieve the _id, display name and
// age of students who have checked out a book in the cloud subject.

coll.find(
    {$and: [{type : "student"}, {"checkouts.subject" : "cloud"}]},
    {display : 1, age : 1}
)


// Question 04 : Write a query to retrieve only the first name,
// last name, and type of faculty users who have checked out
// at least one book with the subject "programming".

coll.find(
    {$and: [{type : "faculty"}, {"checkouts.subject" : "programming"}]},
    {fname : 1, lname : 1, type : 1, _id : 0}
)


// Question 05 : Write a query to retrieve the documents of users who
// are either a part of faculty and checked out book 5235 or
// students under the age of 30 who have checked out book 5240.
// Display the documents in a readable format.

coll.find({$or: [
    {$and: [{type : "faculty"}, {"checkouts.book" : "5235"}]},
    {$and: [{age : {$lt: 30}}, {"checkouts.book" : "5240"}]}
]}).pretty()


// Question 06 : Write a query to display the first name, last name,
// and age of students who are between the ages of 22 and 26.

coll.find(
    {$and: [{age : {$gt: 22}}, {age : {$lt: 26}}]},
    {fname : 1, lname : 1, age : 1, _id : 0}
).sort({age : 1, fname : 1})
