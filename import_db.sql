DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL


);

DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)

);

DROP TABLE if exists question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE if exists replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)

);


DROP TABLE if exists question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)


);


INSERT INTO
  users (fname, lname)
VALUES
  ('Patrick', 'Chao'),
  ('Rewel', 'Garcia');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Why does SQL suck?', 'Really, someone explain this to me', 1),
  ('this is a question', 'answer', 1),
  ('this is a dog', 'cat', 1),
  ('What is going on?', 'How does Zion have so much energy?', 2);

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 2);

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (1, 2),
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1);

INSERT INTO
  replies (user_id, question_id, parent_id, body)
VALUES
  (1, 2, NULL, 'Zion is not of this world.'),
  (2, 1, NULL, 'There is no hope.'),
  (1, 1, 2, 'Thanks for nothing.'),
  (2, 2, 1, 'I agree. We should investigate further.');
