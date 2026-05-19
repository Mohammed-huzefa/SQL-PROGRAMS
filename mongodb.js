mongosh



use mydb1



db.createCollection("users")



db.users.insertOne({
  name: "Alice",
  age: 25,
  city: "Bangalore"
})



db.users.insertMany([
  { name: "Bob", age: 30 },
  { name: "Charlie", age: 28 }
])



db.users.find()



db.users.find().pretty()



db.users.find({ name: "Alice" })



db.users.updateOne(
  { name: "Alice" },
  { $set: { age: 26 } }
)



db.users.updateMany(
  {},
  { $set: { active: true } }
)



db.users.deleteOne({ name: "Bob" })



db.users.deleteMany({ age: { $lt: 29 } })



show dbs



show collections



db.users.drop()



db.dropDatabase()