"""
    Sample Controller File

    A Controller should be in charge of responding to a request.
    Load models to interact with the database and load views to render them to the client.

    Create a controller using this template
"""
from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)
        """
            This is an example of loading a model.
            Every controller has access to the load_model method.
        """
        self.load_model('User')
        self.db = self._app.db

        """
        
        This is an example of a controller method that will load a view for the client 

        """
   
    def index(self):
        """
        A loaded model is accessible through the models attribute 
        self.models['WelcomeModel'].get_users()
        
        self.models['WelcomeModel'].add_message()
        # messages = self.models['WelcomeModel'].grab_messages()
        # user = self.models['WelcomeModel'].get_user()
        # to pass information on to a view it's the same as it was with Flask
        
        # return self.load_view('index.html', messages=messages, user=user)
        """
        if not 'id' in session:
            session['id'] = ""
        return self.load_view('index.html')

    def add_user(self):
        post = request.form
        first_name = post['first_name']
        alias = post['alias']
        email = post['email']
        password = post['password']
        password_cf = post['password_confirmation']

        user = {'first_name': first_name, 'alias': alias, 'email': email, 'password': password, 'password_confirmation': password_cf}
        result = self.models['User'].add_user(user)
        if result == False:
            return redirect('/')

        session['id'] = result
        return redirect('/success')

    def login(self):
        post = request.form
        email = post['email_login']
        password = post['password_login']
        user = {'email': email, 'password': password}

        result = self.models['User'].login(user)
        if result == False:
            return redirect('/')
        session['id'] = result
        return redirect('/success')

    def success(self):
        user = {'id': session['id']}
        users = self.models['User'].get_all_users_with_poke(user)
        return self.load_view('success.html', users = users)

    def logout(self):
        session.pop('id')
        return redirect('/')





