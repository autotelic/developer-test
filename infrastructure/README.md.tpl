# React/Redux App - tech test

First of all, this test is not about finishing - awesome if you do! - but about what solutions you
applied on each part of the test. We are excited to see what you can get done!

## Setup

* Clone the repository.
* Install the dependencies using yarn:

```
$ yarn
$ yarn run start
```

The App will be running at `localhost:8080`

This application uses [React][1] as our view layer with [Redux][2] for state management and
[Found][3] to handle routing.

## Test instructions

### Fixing bugs

There may be a couple of bugs. Don't panic! See if you can fix them.

### Features development

Given the following RESTful API endpoints at [${ api_host }](${ api_host }):
  * GET /messages
  * GET /messages/{id}
  * DELETE /messages/{id}
  * POST /messages

add these features to a new branch in this same repo and open a PR to master:
  * Viewing a list of messages with the message text and the date the message was posted.
  * Viewing all details of a single message on a separate page.
  * Deleting a message.
  * Posting a new message.

### Stretch goals

  * Display a loading indicator whilst data is being fetched.
  * Order the list of messages to show the most recent first.


[1]:https://reactjs.org/

[2]:http://redux.js.org/docs/introduction/

[3]:https://github.com/4Catalyzer/found
