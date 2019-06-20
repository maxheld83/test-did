workflow "Run Docker in Docker" {
  on = "push",
  resolves = [
    "fails"
  ]
}

action "works" {
  uses = "actions/docker/cli@master"
  args = [
    "run",
    "--mount 'type=bind,source=/usr/bin,destination=/github/workspace'",
    "github/docker-cli:master"
  ]
}

action "fails" {
  uses = "actions/docker/cli@master"
  args = [
    "run",
    "--mount 'type=bind,source=/github/workspace,destination=/github/workspace'",
    "github/docker-cli:master"
  ]
  needs = "works"
}
