terraform {
  cloud {
    organization = "ajay-foundation-platform"

    workspaces {
      name = "foundation-platform-dev"
    }
  }
}