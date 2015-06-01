
# POST /api/arena

+ Request (application/json)

- `name`: String (e.g. "hogehoge")

+ Response 200 (application/json)

        {
   "arena" : {
      "foursquare_id" : "5104",
      "id" : "4e9dbbc2-830b-41a9-b7db-9987735a0b2a",
      "latitude" : 40.721294,
      "longitude" : -73.983994,
      "name" : "hogehoge"
   }
}



# GET /api/arena/:id

+ Request ()


+ Response 200 (application/json)

        {
   "arena" : {
      "foursquare_id" : "5104",
      "id" : "4e9dbbc2-830b-41a9-b7db-9987735a0b2a",
      "latitude" : 40.721294,
      "longitude" : -73.983994,
      "name" : "hogehoge"
   }
}


