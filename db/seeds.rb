# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t1 = Topic.create(name: "US Citizenship Civic Test", description: "Civics (History and Government) Questions for the Naturalization Test")


q1 = Question.create(text: "What is the supreme law of the land?");
a1_1 = Answer.create(text: "the Constitution")
q1.answers.push(a1_1)
q1.save
t1.questions.push(q1)
t1.save

q2 = Question.create(text: "What does the Constitution do?");
t1.questions.push(q2)
t1.save
a2_1 = Answer.create(text: "sets up the government");
a2_2 = Answer.create(text: "defines the government");
a2_3 = Answer.create(text: "protects basic rights of Americans");
q2.answers.push(a2_1)
q2.answers.push(a2_2)
q2.answers.push(a2_3)
q2.save


q3 = Question.create(text: "The idea of self-government is in the first three words of the Constitution. What are these words?");
a3_1 = Answer.create(text: "We the People");
q3.answers.push(a3_1)
q3.save
t1.questions.push(q3)
t1.save

q4 = Question.create(text: "What is an amendment?");
a4_1 = Answer.create(text: "a change (to the Constitution)");
a4_2 = Answer.create(text: "an addition (to the Constitution)");
q4.answers.push(a4_1)
q4.answers.push(a4_2)
q4.save
t1.questions.push(q4)
t1.save

q5 = Question.create(text: "What do we call the first ten amendments to the Constitution?");
a5_1 = Answer.create(text: "the Bill of Rights");
q5.answers.push(a5_1)
q5.save
t1.questions.push(q5)
t1.save

q6 = Question.create(text: "What is one right or freedom from the First Amendment?");
a6_1 = Answer.create(text: "speech");
a6_2 = Answer.create(text: "religion");
a6_3 = Answer.create(text: "assembly");
a6_4 = Answer.create(text: "press");
a6_5 = Answer.create(text: "petition the government");
q6.answers.push(a6_1)
q6.answers.push(a6_2)
q6.answers.push(a6_3)
q6.answers.push(a6_4)
q6.answers.push(a6_5)
q6.save
t1.questions.push(q6)
t1.save

q7 = Question.create(text: "How many amendments does the Constitution have?");
a7_1 = Answer.create(text: "twenty-seven (27)");
q7.answers.push(a7_1)
q7.save
t1.questions.push(q7)
t1.save