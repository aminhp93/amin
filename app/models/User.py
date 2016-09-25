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
        DOB = re.compile(r'^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$')
        errors = 0
        # Some basic validation
        if not user['name']:
            errors += 1
            flash('Name cannot be blank', 'name')
        elif len(user['name']) < 2:
            errors += 1
            flash('Name must be at least 2 characters long', 'name')

        query = "SELECT * FROM users WHERE name = :name"
        data = {'name': user['name']}
        test_name = self.db.query_db(query, data)
        if len(test_name) != 0:
            errors += 1
            flash('This name has been used', 'name')

        if not user['alias']:
            errors += 1
            flash('Alias cannot be blank', 'alias')
        elif len(user['alias']) < 2:
            errors += 1
            flash('Alias must be at least 2 characters long', 'alias')

        if not user['email']:
            errors += 1
            flash('Email cannot be blank', 'email')
        elif not EMAIL_REGEX.match(user['email']):
            errors += 1
            flash('Email format must be valid!', 'email')

        query = "SELECT * FROM users WHERE email = :email"
        data = {'email': user['email']}
        test_email = self.db.query_db(query, data)
        if len(test_email) != 0:
            errors += 1
            flash('This email has been used', 'email')

        if not user['password']:
            errors += 1
            flash('Password cannot be blank', 'password')
        elif len(user['password']) < 8:
            errors += 1
            flash('Password must be at least 8 characters long', 'password')
        elif user['password'] != user['password_confirmation']:
            errors += 1
            flash('Password and confirmation must match!', 'password')

        if not user['date_of_birth']:
            errors += 1
            flash('Date of birth cannot be blank', 'date_of_birth')
        elif not DOB.match(user['date_of_birth']):
            errors += 1
            flash('Your date of birth is not valid', 'date_of_birth')

        # If we hit errors, return them, else return True.
        if errors > 0:
            return False
        else:
            flash('You successfully registerd. Please log in.', 'login_success')
            password = user['password']

            pw_hash = self.bcrypt.generate_password_hash(password)

            query = "INSERT into users (name, alias, email, password, date_of_birth, created_at) values(:name, :alias, :email, :password, :date_of_birth, NOW())"
            data = {'name': user['name'], 'alias': user['alias'], 'email': user['email'], 'password': pw_hash, 'date_of_birth': user['date_of_birth']}
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
        query = "SELECT users.id, users.name, users.alias, users.email, pokes2.number as user_pokes, pokes3.number as friend_pokes FROM users LEFT JOIN (SELECT * FROM pokes WHERE pokes.user_id = :id) as pokes2 ON users.id = pokes2.friend_id LEFT JOIN (SELECT * FROM pokes WHERE pokes.friend_id = :id) as pokes3 ON users.id = pokes3.user_id WHERE users.id != :id ORDER BY user_pokes DESC"
        data = {'id': user['id']}
        result = self.db.query_db(query, data)
        return result

    def count_poked_friend(self, id):
        query = "SELECT COUNT(*) as count FROM pokes WHERE friend_id = :id"
        data = {'id': id}
        result = self.db.query_db(query, data)
        return result



