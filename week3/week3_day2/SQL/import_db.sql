DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS user_likes;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

INSERT INTO
  users(fname,lname)
VALUES
  ('Joe','Schmoe'), ('Jane','Lane'), ('Jimmy', 'Li');

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)

);

INSERT INTO
  questions (title, body, author_id)
SELECT
  'Joe''s Title', 'Joe Text', users.id
FROM
  users
WHERE
  users.fname = 'Joe' AND users.lname = 'Schmoe';

INSERT INTO
  questions (title, body, author_id)
SELECT
  'Jimmy''s Title', 'Jimmy Text', users.id
FROM
  users
WHERE
  users.fname = 'Jimmy' AND users.lname = 'Li';

INSERT INTO
  questions (title, body, author_id)
SELECT
  'Jane''s Title', 'Jane Text', users.id
FROM
  users
WHERE
  users.fname = 'Jane' AND users.lname = 'Lane';




CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE users.fname = 'Jimmy' AND users.lname = 'Li'),
  (SELECT id FROM questions WHERE questions.title = 'Jimmy''s Title')),

  ((SELECT id FROM users WHERE users.fname = 'Jane' AND users.lname = 'Lane'),
  (SELECT id FROM questions WHERE questions.title = 'Jane''s Title')),

  ((SELECT id FROM users WHERE users.fname = 'Joe' AND users.lname = 'Schmoe'),
  (SELECT id FROM questions WHERE questions.title = 'Joe''s Title')),

  ((SELECT id FROM users WHERE users.fname = 'Joe' AND users.lname = 'Schmoe'),
  (SELECT id FROM questions WHERE questions.title = 'Jane''s Title')),

  ((SELECT id FROM users WHERE users.fname = 'Jane' AND users.lname = 'Lane'),
  (SELECT id FROM questions WHERE questions.title = 'Jimmy''s Title')),

  ((SELECT id FROM users WHERE users.fname = 'Joe' AND users.lname = 'Schmoe'),
  (SELECT id FROM questions WHERE questions.title = 'Jimmy''s Title'));

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)

);

INSERT INTO
  replies(question_id,parent_reply_id,author_id,body)
VALUES
  ((SELECT id FROM questions WHERE questions.title = 'Jimmy''s Title'),
  NULL,
  (SELECT id FROM users WHERE users.fname = 'Jimmy' AND users.lname = 'Li'),
  'Man, calm down dude. Cmon man!');

INSERT INTO
  replies(question_id,parent_reply_id,author_id,body)
VALUES
  ((SELECT id FROM questions WHERE questions.title = 'Jimmy''s Title'),
  (SELECT id FROM replies WHERE body = 'Man, calm down dude. Cmon man!'),
  (SELECT id FROM users WHERE users.fname = 'Joe' AND users.lname = 'Schmoe'),
  'BARBEQUE CHICKEN!');


CREATE TABLE user_likes (
  id INTEGER PRIMARY KEY,
  user_id  INTEGER NOT NULL,
  question_id  INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES question(id)

);

INSERT INTO
  user_likes(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE users.fname = 'Jimmy' AND users.lname = 'Li'),
  (SELECT id FROM questions WHERE questions.title = 'Jimmy''s Title'));

INSERT INTO user_likes(user_id,question_id) VALUES(3,1);
INSERT INTO user_likes(user_id,question_id) VALUES(2,2);
INSERT INTO user_likes(user_id,question_id) VALUES(1,2);
