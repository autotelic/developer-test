provider "heroku" {
  email   = "${var.heroku_account_email}"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "developertest" {
  name   = "${var.application_name}"
  region = "us"
}

resource "heroku_addon" "database" {
  app        = "${heroku_app.developertest.name}"
  plan       = "heroku-postgresql:hobby-basic"
  depends_on = ["local_file.readme"]

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

provider "github" {
  token        = "${var.github_token}"
  organization = "${var.github_organization}"
}

data "template_file" "readme" {
  template = "${file("${path.module}/README.md.tpl")}"

  vars {
    api_host = "${heroku_app.developertest.web_url}"
  }
}

resource "local_file" "readme" {
  content  = "${data.template_file.readme.rendered}"
  filename = "${path.module}/../react-redux-app/README.md"
}

resource "github_repository" "test_repository" {
  name        = "${var.application_name}"
  description = "Autotelic technical test repository"
  private     = true
  depends_on  = ["local_file.readme"]

  provisioner "local-exec" {
    working_dir = "${path.module}/../react-redux-app"

    command = <<EOT
      git init && \
      git add . && \
      git commit -m 'First commit' && \
      git remote add origin ${var.git_ssh_url}:${github_repository.test_repository.full_name}.git && \
      git push -u origin master && \
      rm -rf .git
EOT
  }
}

resource "github_repository_collaborator" "autotelic_test_collaborator" {
  repository = "${var.application_name}"
  username   = "${var.github_username}"
  depends_on = ["github_repository.test_repository"]
}
