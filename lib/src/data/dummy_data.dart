class Dummy {
  static List<Map<String, dynamic>> workoutList = [
    {
      "_id": "642a7b74853eaaa56e0b0292",
      "ctgList": [
        "\"{\\\"category1\\\": [\\\"exercise1\\\", \\\"exercise2\\\", \\\"exercise3\\\"], \\\"category2\\\": [\\\"exercise4\\\", \\\"exercise5\\\"]}\""
      ],
      "desc": "This is a workout description",
      "est": 30,
      "img": "https://example.com/workout.jpg",
      "title": "My Awesome Workout",
      "totalEst": 120,
      "vid": "https://example.com/workout.mp4",
      "workoutEsts": [
        "\"[45, 30, 20, 25]\""
      ],
      "workoutLists": [
        "[{\"name\":\"Exercise 1\",\"reps\":10,\"sets\":3},{\"name\":\"Exercise 2\",\"reps\":8,\"sets\":4},{\"name\":\"Exercise 3\",\"reps\":12,\"sets\":2}]"
      ],
      "workoutId": 1234,
      "updated_at": "2023-04-03T07:08:36.276000Z",
      "created_at": "2023-04-03T07:08:36.276000Z"
    },
    {
      "_id": "642a7b9a853eaaa56e0b0293",
      "ctgList": "\"{\\\"category1\\\": [\\\"exercise1\\\", \\\"exercise2\\\", \\\"exercise3\\\"], \\\"category2\\\": [\\\"exercise4\\\", \\\"exercise5\\\"]}\"",
      "desc": "This is a workout description",
      "est": 30,
      "img": "https://example.com/workout.jpg",
      "title": "My Awesome Workout",
      "totalEst": 120,
      "vid": "https://example.com/workout.mp4",
      "workoutEsts": "\"[45, 30, 20, 25]\"",
      "workoutLists": "[{\"name\":\"Exercise 1\",\"reps\":10,\"sets\":3},{\"name\":\"Exercise 2\",\"reps\":8,\"sets\":4},{\"name\":\"Exercise 3\",\"reps\":12,\"sets\":2}]",
      "workoutId": 1234,
      "updated_at": "2023-04-03T07:09:15.003000Z",
      "created_at": "2023-04-03T07:09:15.003000Z"
    },
    {
      "_id": "642a7bc8853eaaa56e0b0294",
      "ctgList": [
        "{\"category1\": [\"exercise1\", \"exercise2\", \"exercise3\"], \"category2\": [\"exercise4\", \"exercise5\"]}",
        true
      ],
      "desc": "This is a workout description",
      "est": 30,
      "img": "https://example.com/workout.jpg",
      "title": "My Awesome Workout",
      "totalEst": 120,
      "vid": "https://example.com/workout.mp4",
      "workoutEsts": [
        "[45, 30, 20, 25]"
      ],
      "workoutLists": [
        [
          {
            "name": "Exercise 1",
            "reps": 10,
            "sets": 3
          },
          {
            "name": "Exercise 2",
            "reps": 8,
            "sets": 4
          },
          {
            "name": "Exercise 3",
            "reps": 12,
            "sets": 2
          }
        ]
      ],
      "workoutId": 1234,
      "updated_at": "2023-04-03T07:10:00.528000Z",
      "created_at": "2023-04-03T07:10:00.528000Z"
    },
  ];

  static List<Map<String, dynamic>> workoutProgramList = [
    {
      "_id": "642ee53732939dc60b0ee632",
      "ctgList": [
        [
          "> 10 menit"
        ],
        true
      ],
      "desc": "This is a workout description",
      "img": "https://example.com/workout.jpg",
      "title": "My Awesome Workout",
      "workouts": [
        [
          "642a7b9a853eaaa56e0b0293",
          "642a7bc8853eaaa56e0b0294"
        ]
      ],
      "updated_at": "2023-04-06T15:28:55.596000Z",
      "created_at": "2023-04-06T15:28:55.596000Z"
    },
  ];

  static List<Map<String, dynamic>> tipList = [
    {
      "_id": "642a2bad24857df66d01b662",
      "title": "ini bukan judul kjhbkjhb",
      "author": "ini author",
      "article": "ini isi",
      "img": "public/images/tips/1680509696.png",
      "updated_at": "2023-04-03T08:14:56.959000Z",
      "created_at": "2023-04-03T01:28:13.941000Z"
    },
    {
      "_id": "642a2c0224857df66d01b663",
      "title": "ini bukan judul",
      "author": "ini author",
      "article": "ini isi",
      "img": "public/images/tips/1680498326.png",
      "updated_at": "2023-04-03T05:05:26.964000Z",
      "created_at": "2023-04-03T01:29:38.604000Z"
    },
    {
      "_id": "642a2c6024857df66d01b664",
      "title": "ini judul",
      "author": "ini author",
      "article": "ini isi",
      "img": "public/images/1680485472.gif",
      "updated_at": "2023-04-03T01:31:12.022000Z",
      "created_at": "2023-04-03T01:31:12.022000Z"
    },
    {
      "_id": "642a2ce624857df66d01b665",
      "title": "ini judul",
      "author": "ini author",
      "article": "ini isi",
      "img": "public/images/1680485606.gif",
      "updated_at": "2023-04-03T01:33:26.597000Z",
      "created_at": "2023-04-03T01:33:26.597000Z"
    },
  ];
}
