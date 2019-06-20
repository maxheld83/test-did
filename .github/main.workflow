workflow "Run Docker in Docker" {
  on = "push",
  resolves = [
    "fails"
  ]
}

action "works" {
  uses = "actions/docker/cli@master"
  env = {
    SOURCE_PATH = "/usr/local"
  }
  runs = [
    "sh",
    "-c",
    "$GITHUB_WORKSPACE/script.sh"
  ]
}

action "fails" {
  uses = "actions/docker/cli@master"
  env = {
    SOURCE_PATH = "/github/workspace"
  }
  runs = [
    "sh",
    "-c",
    "$GITHUB_WORKSPACE/script.sh"
  ]
  needs = "works"
}
