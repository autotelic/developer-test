variable "application_name" {
  description = "The name of the heroku app"
}

variable "heroku_api_key" {
  description = "The api key for heroku"
}

variable "heroku_account_email" {
  description = "The email of the heroku account used to create the resources"
}

variable "github_token" {
  description = "github access token"
}

variable "github_username" {
  description = "User to be added as a collaborator"
}

variable "github_organization" {
  description = "The github organization to create the resources"
  default     = "autotelic"
}

variable "git_ssh_url" {
  description = "the ssh url a user uses to interact with github organization"
  default     = "git@github.com"
}
