User.create([
  {email: 'jim@mail.com', password: "1234"},
  {email: 'mason@mail.com', password: "1234"},
  {email: 'michal@mail.com', password: "1234"},
  {email: 'eddie@mail.com', password: "1234"},
  ])

Question.create([
  {body: 'I want to plan something really special for my wife, what is a good place to take her out?', user_id: 1},
  {body: "What's a good restaurant to take my girlfriend for Valentine's day next year?", user_id: 2},
  {body: 'How do I sweep someone off their feet?', user_id: 3},
  {body: "I don't know if I should make the first move, any advice?", user_id: 4},
  {body: 'How do I deal with a long distance relationship?', user_id: 1},
  {body: "How to express my love without being clingy?", user_id: 2},
  {body: 'What can I do to get her to listen to me?', user_id: 3},
  {body: "How to get my ex back?", user_id: 4},
  ])

Answer.create([
  {body: 'Take her out to a different city dude!', question_id: 1, user_id: 4},
  {body: "Why are you planning so far ahead? Are places even taking reservations? This isn't much of an answer, sorry.", question_id: 2, user_id: 3},
  {body: 'Make sure you are very charming and kind!', question_id: 3, user_id: 2},
  {body: 'Seize the moment!', question_id: 4, user_id: 1},
  {body: 'Regularly talk on the phone, and carve out time to video chat!', question_id: 5, user_id: 2},
  {body: "Tell your partner you love them, but understand that they may need space.", question_id: 6, user_id: 4},
  {body: 'Say valuable and meaningful things!', question_id: 7, user_id: 1},
  {body: "Don't try, it clearly didn't work.", question_id: 8, user_id: 3},
  ])

Response.create([
  {body: 'I was wondering the same thing, great question.', responsable_type: 'Question', responsable_id: 1, user_id: 4},
  {body: 'I also like to plan 11 months in advance.', responsable_type: 'Question', responsable_id: 2, user_id: 3},
  {body: 'If only I knew...', responsable_type: 'Question', responsable_id: 3, user_id: 2},
  {body: 'This is tricky, hope you get some good responses.', responsable_type: 'Question', responsable_id: 4, user_id: 1},
  {body: 'Great advice!', responsable_type: 'Answer', responsable_id: 1, user_id: 4},
  {body: 'Come on man, answer the question! Use the site properly!', responsable_type: 'Answer', responsable_id: 2, user_id: 3},
  {body: 'Sound advice from a vet in the love game!', responsable_type: 'Answer', responsable_id: 3, user_id: 2},
  {body: "Yeah, seize it!", responsable_type: 'Answer', responsable_id: 4, user_id: 1},
  {body: 'I was wondering the same thing, great question.', responsable_type: 'Question', responsable_id: 5, user_id: 2},
  {body: 'I also like to plan 11 months in advance.', responsable_type: 'Question', responsable_id: 6, user_id: 3},
  {body: 'If only I knew...', responsable_type: 'Question', responsable_id: 7, user_id: 1},
  {body: 'This is tricky, hope you get some good responses.', responsable_type: 'Question', responsable_id: 8, user_id: 4},
  {body: 'Phone conversation is definitely important!', responsable_type: 'Answer', responsable_id: 5, user_id: 3},
  {body: 'Right on! Always express your love!', responsable_type: 'Answer', responsable_id: 6, user_id: 2},
  {body: 'Very useful tip!', responsable_type: 'Answer', responsable_id: 7, user_id: 1},
  {body: "Woah, let him pursue his love!", responsable_type: 'Answer', responsable_id: 8, user_id: 4},
  ])