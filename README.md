# Autotelic Technical Test Setup

This repo contains the code and infrastructure setup for the autotelic technical assesment.

## Requirements

To setup a new test you will need to setup:

[Terraform](https://www.terraform.io/downloads.html)

[Docker](https://docs.docker.com/docker-for-mac/install/)

python / pip: `brew install python`

virtualenv `pip install virtualenv`

postgres `brew install postgresql`

## Setup

- First create a virtual environment to work in using python 2.7

```
  mkvirtualenv autotelic-technical-test
```

- Next install the api dependencies

```
cd developertestapi
pip install -r requirements.txt
```

- Initialize terraform

```
cd infrastructure
terraform init
```

You should now be ready to create and provision the necessary resources.

## Run

From the infrastructure directory:

### TODO(jkirkpatrick24): Manage these secrets with aws vault & chamber.
You will be prompted to provide some variables when running terraform to create
the infrastructure.

| Variable | Description | Default |
| --- | --- | --- |
| application_name | The name of the heroku app | none |
| heroku_api_key | The api key for heroku | none |
| heroku_account_email | The email of the heroku account used to create the resources | none |
| github_token | github access token | none |
| github_username | User to be added as a collaborator | none |
| github_organization | The github organization to create the resources | autotelic |
| git_ssh_url | the ssh url a user uses to interact with github organization | git@github.com |

To see the resources that will be created:

`terraform plan`

If you are satisfied that the correct resources will be created, to apply the changes:

`terraform apply`

## Cleanup

To destroy the resources simply:

`terraform destroy`
