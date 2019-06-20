workflow "Run Docker in Docker" {
  on = "push",
  resolves = "did"
}

action "did" {
  uses = "actions/docker/cli@master"
  args = [
    "run",
    "--mount 'type=bind,source=/github/workspace,destination=/github/workspace'",
    "github/docker-cli"
  ]
}
