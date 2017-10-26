# Setup

In a fresh repo (or remove existing app):

    $ heroku create <app_name> -r <remote_name>
    $ git push <remote_name> master
    $ heroku run python manage.py loaddata msgs -r <remote_name>

To remove existing app:

    $ heroku apps:destroy <name of app> --confirm <name of app>
