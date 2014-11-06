Hash.from_xml(File.read("db/nyc-courts.xml"))["basketball"]["facility"].inject({}) do |_result, elem|
  Location.create(name: elem["Name"], address: elem["Location"], city: "New York", state: "NY")
end

games = Game.create([
                      {
                        name: "Senior League",
                        time: Time.parse("7:00"),
                        date: Date.parse("05/11/2014"),
                        description: "A game for some older guys who still want to ball. Open to anyone, but we don't want it filled with young bucks",
                        location_id: 3,
                        user_id: 1
                      },
                      {
                        name: "Saturdays",
                        time: Time.parse("11:00"),
                        date: Date.parse("10/11/2014"),
                        description: "A friendly Saturday game. Open to anyone.",
                        location_id: 5,
                        user_id: 1
                      },
                      {
                        name: "Our Game",
                        time: Time.parse("18:00"),
                        date: Date.parse("21/11/2014"),
                        description: "Been playing together for years, just trying to stay in shape",
                        location_id: 8,
                        user_id: 1
                      },
                      {
                        name: "pLAyers",
                        time: Time.parse("13:00"),
                        date: Date.parse("20/11/2014"),
                        description: "For all my LA guys in town",
                        location_id: 10,
                        user_id: 1
                      },
                      {
                        name: "In the park",
                        time: Time.parse("15:00"),
                        date: Date.parse("28/11/2014"),
                        description: "I will be at the park at this time. Come and play if you are interested",
                        location_id: 5,
                        user_id: 1
                      },
                      {
                        name: "For the kids",
                        time: Time.parse("11:00"),
                        date: Date.parse("09/11/2014"),
                        description: "Ours kids usually get together and play at this time. Ages: 11-14",
                        location_id: 5,
                        user_id: 1
                      },
                      {
                        name: "Jam Session",
                        time: Time.parse("9:00"),
                        date: Date.parse("03/11/2014"),
                        description: "For high flyers looking to jam. Or anyone.",
                        location_id: 17,
                        user_id: 1
                      },
                      {
                        name: "Nothing Fancy",
                        time: Time.parse("10:00"),
                        date: Date.parse("14/11/2014"),
                        description: "Just straight up b-ball.",
                        location_id: 2,
                        user_id: 1
                      },
                      {
                        name: "Funday",
                        time: Time.parse("9:00"),
                        date: Date.parse("01/11/2014"),
                        description: "Have a 'Funday' playing the best game on Earth.",
                        location_id: 9,
                        user_id: 1
                      },
                      {
                        name: "Da Bulls",
                        time: Time.parse("19:00"),
                        date: Date.parse("17/11/2014"),
                        description: "Because the Bulls are the best team ever.",
                        location_id: 16,
                        user_id: 1
                      },
                      {
                        name: "Looking for more players",
                        time: Time.parse("17:00"),
                        date: Date.parse("12/11/2014"),
                        description: "Trying to get more competition at the park. Come play with us.",
                        location_id: 12,
                        user_id: 1
                      },
                      {
                        name: "Pioneer Ball",
                        time: Time.parse("8:00"),
                        date: Date.parse("11/11/2014"),
                        description: "3 pointers and full court press. Pioneer basketball baby",
                        location_id: 13,
                        user_id: 1
                      }
                    ])

User.create!([
              {
               email: 'test@test.com',
               username: 'Tester',
               password: 'password123'
              },
              {
               email: 'palo@alto.com',
               username: 'Palo Alto',
               password: '123456789'
              },
              {
               email: 'baller@test.com',
               username: 'Baller',
               password: '123456789'
              },
              {
               email: 'bulls@test.com',
               username: 'BullsFan',
               password: '123456789'
              },
              {
               email: 'kingjames@test.com',
               username: 'King23James',
               password: '123456789'
              },
              {
               email: 'celtics@test.com',
               username: 'BCeltics',
               password: '123456789'
              }
            ])

Player.create([
                {
                  user_id: 1,
                  game_id: 11
                },
                {
                  user_id: 1,
                  game_id: 9
                },
                {
                  user_id: 1,
                  game_id: 6
                },
                {
                  user_id: 1,
                  game_id: 2
                },
                {
                  user_id: 2,
                  game_id: 6
                },
                {
                  user_id: 2,
                  game_id: 9
                },
                {
                  user_id: 3,
                  game_id: 9
                },
                {
                  user_id: 3,
                  game_id: 5
                },
                {
                  user_id: 3,
                  game_id: 7
                },
                {
                  user_id: 4,
                  game_id: 11
                },
                {
                  user_id: 4,
                  game_id: 12
                },
                {
                  user_id: 4,
                  game_id: 10
                },
                {
                  user_id: 4,
                  game_id: 1
                },
                {
                  user_id: 4,
                  game_id: 4
                },
                {
                  user_id: 5,
                  game_id: 12
                },
                {
                  user_id: 5,
                  game_id: 8
                },
                {
                  user_id: 5,
                  game_id: 3
                },
                {
                  user_id: 6,
                  game_id: 11
                },
                {
                  user_id: 6,
                  game_id: 8
                },
                {
                  user_id: 6,
                  game_id: 6
                }
              ])

Comment.create([
                 {
                  user_id: 1,
                  game_id: 11,
                  body: "Gonna be good. Can't wait to ball."
                  },
                  {
                  user_id: 4,
                  game_id: 11,
                  body: "I will be like 5 minutes late guys."
                  },
                  {
                  user_id: 1,
                  game_id: 9,
                  body: "We need to get some more people for this game."
                  },
                  {
                  user_id: 2,
                  game_id: 9,
                  body: "I will try to find some friends."
                  },
                  {
                  user_id: 3,
                  game_id: 9,
                  body: "I am not sure I can make it, but I will try."
                  },
                  {
                  user_id: 1,
                  game_id: 6,
                  body: "This should be a fun one."
                  },
                  {
                  user_id: 2,
                  game_id: 6,
                  body: "Yeah I am excited to get out there and play with you guys."
                  },
                  {
                  user_id: 6,
                  game_id: 6,
                  body: "We should do it again next week."
                  },
                  {
                  user_id: 1,
                  game_id: 2,
                  body: "Come on let's make this a Saturday thing."
                  }
                ])
