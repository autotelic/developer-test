# Setup

In a fresh repo (or remove existing app):

    $ heroku create
    $ git push heroku master
    $ heroku run python manage.py loaddata msgs
    $ heroku addons:create papertrail

To remove existing app:

    $ heroku apps:destroy <name of app> --confirm <name of app>
    $ git remote rm heroku