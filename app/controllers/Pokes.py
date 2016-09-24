"""
    Sample Controller File

    A Controller should be in charge of responding to a request.
    Load models to interact with the database and load views to render them to the client.

    Create a controller using this template
"""
from system.core.controller import *

class Pokes(Controller):
    def __init__(self, action):
        super(Pokes, self).__init__(action)
        """
            This is an example of loading a model.
            Every controller has access to the load_model method.
        """
        self.load_model('Poke')
        self.db = self._app.db

        """
        
        This is an example of a controller method that will load a view for the client 

        """
   
    def insert_poke(self, id):
        number = str(int(request.form['number']) + 1)
        poke = {'user_id': session['id'], 'friend_id': id, 'number': number}
        self.models['Poke'].insert_poke(poke)
        return redirect('/success')









