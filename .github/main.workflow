workflow "Run Docker in Docker" {
  on = "push",
  resolves = [
    "fails"
  ]
}

action "works" {
  uses = "./"
  env = {
    SOURCE_PATH = "/usr/local"
  }
}

action "fails" {
  uses = "./"
  env = {
    SOURCE_PATH = "/github/workspace"
  }
  needs = "works"
}
