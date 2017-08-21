require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0
    Users.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0
    Users.new(user.first)
  end

  attr_accessor :fname, :lname
  attr_reader :id

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Questions.find_by_author_id(@id)
  end

  def authored_replies
     Replies.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(@id)
  end

end



class Questions
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0
    Questions.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless question.length > 0
      question.map {|q| Questions.new(q) }
  end

  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end


  attr_reader :id, :author_id
  attr_accessor :title, :body

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    Users.find_by_id(@author_id)
  end

  def replies
    Replies.find_by_question(@id)
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end
end

class QuestionFollows

  def self.find_by_id(id)
    qf = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil unless qf.length > 0
    QuestionFollows.new(qf.first)
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.id, users.fname, users.lname
      FROM
        question_follows
      JOIN
        users ON question_follows.user_id = users.id
      WHERE
        question_id = ?
    SQL
    return nil unless followers.length > 0
    followers.map { |f| Users.new(f) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.id, questions.title, questions.body, questions.author_id
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      WHERE
        user_id = ?
    SQL
    return nil unless questions.length > 0
    questions.map { |f| Questions.new(f) }
  end

  def self.most_followed_questions(n)
    most_followed = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        questions.id, questions.title, questions.body, questions.author_id
      FROM
        question_follows
      LEFT JOIN
        questions ON question_follows.question_id = questions.id
      GROUP BY
        questions.title
      ORDER BY
        COUNT(user_id) DESC
      LIMIT
        #{n}
    SQL
    return nil unless most_followed.length > 0
    most_followed.map { |f| Questions.new(f) }
  end

  attr_reader :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

class Replies

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first)
  end

  def self.find_by_question(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0
    reply.map { |rep| Replies.new(rep) }
  end

  attr_reader :id, :question_id, :parent_reply_id, :author_id
  attr_accessor :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @author_id = options['author_id']
    @body = options['body']
  end

  def parent_reply
    Replies.find_by_id(@parent_reply_id)
  end

  def author
    Users.find_by_id(@author_id)
  end

  def question
    Questions.find_by_id(@question_id)
  end

  def child_replies
    childs = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
      LIMIT
        1
    SQL
    return nil if childs.length < 1
    Replies.new(childs.first)
  end


end

class QuestionLikes

  def self.find_by_id(id)
    ql = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless ql.length > 0
    QuestionLikes.new(ql.first)
  end

  def self.likers_for_question_id(question_id)


  end


  attr_reader :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end



end
