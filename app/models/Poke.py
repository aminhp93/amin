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

class Poke(Model):
    def __init__(self):
        super(Poke, self).__init__()
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

    def insert_poke(self, poke):
        data = {'user_id': poke['user_id'], 'friend_id': poke['friend_id'], 'number': poke['number']}
        query = "SELECT * FROM pokes WHERE user_id = :user_id AND friend_id = :friend_id"
        result = self.db.query_db(query, data)

        if result: 
            query = "UPDATE pokes SET number = :number WHERE user_id = :user_id AND friend_id = :friend_id"
            self.db.query_db(query, data)
            return True

        query = "INSERT into pokes(user_id, friend_id, number) VALUES (:user_id, :friend_id, :number)"
        self.db.query_db(query, data)
        return True




