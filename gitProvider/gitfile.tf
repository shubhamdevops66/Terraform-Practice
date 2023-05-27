terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.11.0"
    }
  }
}

provider "github" {
  token = "you_token_id"
}

resource "github_repository" "myrepo" {
  name        = "gitterraformrepo"
  description = "My terraform repo"
  visibility = "private"
}
