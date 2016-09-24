""" 
    Sample Model File

    A Model should be in charge of communicating with the Database. 
    Define specific model method that query the database for information.
    Then call upon these model method in your controller.

    Create a model using this template.
"""
from system.core.model import Model
from flask import flash
import re

class User(Model):
    def __init__(self):
        super(User, self).__init__()
    """
    Below is an example of a model method that queries the database for all users in a fictitious application
    
    Every model has access to the "self.db.query_db" method which allows you to interact with the database

    def get_users(self):
        query = "SELECT * from users"
        return self.db.query_db(query)

    def get_user(self):
        query = "SELECT * from users where id = :id"
        data = {'id': 1}
        return self.db.get_one(query, data)

    def add_message(self):
        sql = "INSERT into messages (message, created_at, users_id) values(:message, NOW(), :users_id)"
        data = {'message': 'awesome bro', 'users_id': 1}
        self.db.query_db(sql, data)
        return True
    
    def grab_messages(self):
        query = "SELECT * from messages where users_id = :user_id"
        data = {'user_id':1}
        return self.db.query_db(query, data)

    """

    def get_user_by_id(self, id):
        query = "SELECT * from users where id = :id"
        data = {'id': id}
        return self.db.query_db(query, data)

    def add_user(self, user):
        EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
        DOB = re.compile(r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$')
        errors = 0
        # Some basic validation
        if not user['first_name']:
            errors += 1
            flash('First name cannot be blank', 'first_name')
        elif len(user['first_name']) < 2:
            errors += 1
            flash('First name must be at least 2 characters long', 'first_name')

        if not user['alias']:
            errors += 1
            flash('Name cannot be blank', 'alias')
        elif len(user['alias']) < 2:
            errors += 1
            flash('Alias must be at least 2 characters long', 'alias')

        if not user['email']:
            errors += 1
            flash('Email cannot be blank', 'email')
        elif not EMAIL_REGEX.match(user['email']):
            errors += 1
            flash('Email format must be valid!', 'email')

        if not user['password']:
            errors += 1
            flash('Password cannot be blank', 'password')
        elif len(user['password']) < 8:
            errors += 1
            flash('Password must be at least 8 characters long', 'password')
        elif user['password'] != user['password_confirmation']:
            errors += 1
            flash('Password and confirmation must match!', 'password')

        # If we hit errors, return them, else return True.
        if errors > 0:
            return False
        else:
            flash('You successfully registerd. Please log in.', 'login_success')
            password = user['password']

            pw_hash = self.bcrypt.generate_password_hash(password)

            query = "INSERT into users (first_name, alias, email, password, created_at) values(:first_name, :alias, :email, :password, NOW())"
            data = {'first_name': user['first_name'], 'alias': user['alias'], 'email': user['email'], 'password': pw_hash}
            return self.db.query_db(query, data)

    def login(self, user):
        if not user['email'] or not user['password']:
            flash('Invalid input', 'login')
            return False

        query = 'SELECT * FROM users WHERE email = :email LIMIT 1'
        data = {'email': user['email']}
        result = self.db.query_db(query, data)

        if result:
            if self.bcrypt.check_password_hash(result[0]['password'], user['password']):
                return result[0]['id']
            else:
                flash('Invalid password', 'login')
                return False
        return False

    def get_all_users_with_poke(self, user):
        query = "SELECT users.id, users.first_name, users.alias, users.email, pokes2.number as user_pokes, pokes3.number as friend_pokes FROM users LEFT JOIN (SELECT * FROM pokes WHERE pokes.user_id = :id) as pokes2 ON users.id = pokes2.friend_id LEFT JOIN (SELECT * FROM pokes WHERE pokes.friend_id = :id) as pokes3 ON users.id = pokes3.user_id WHERE users.id != :id"
        data = {'id': user['id']}
        result = self.db.query_db(query, data)
        return result



