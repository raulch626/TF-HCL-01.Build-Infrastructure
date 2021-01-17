variable "region" {
  default = "us-west-2"
}

variable "amis" {
  type = map(string) // Mapping that requires all values to be strings.
  default = {
    "us-east-1" = "ami-04d29b6f966df1537"
    "us-west-2" = "ami-0e472933a1395e172"
  }
}
