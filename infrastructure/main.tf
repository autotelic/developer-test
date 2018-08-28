provider "heroku" {
  email   = "${var.heroku_account_email}"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "developertest" {
  name   = "${var.application_name}"
  region = "us"
}

resource "heroku_addon" "database" {
  app  = "${heroku_app.developertest.name}"
  plan = "heroku-postgresql:hobby-basic"

  provisioner "local-exec" {
    working_dir = "${path.module}/.."

    command = <<EOT
    heroku container:push web -a ${heroku_app.developertest.name} && \
    heroku container:release web -a ${heroku_app.developertest.name}
EOT
  }

  provisioner "local-exec" {
    working_dir = "${path.module}/../developertestapi"

    command = <<EOT
    heroku run python manage.py migrate -a ${heroku_app.developertest.name} && \
    heroku run python manage.py loaddata msgs -a ${heroku_app.developertest.name}
EOT
  }
}
