provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://54.242.247.47:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "4782d2d3-a6c7-aff3-fc56-1c6fc8c6cec3"
      secret_id = "4394751a-4bc7-e0f9-462d-bc709f291aa6"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}