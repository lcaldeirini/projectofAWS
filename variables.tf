variable "inst_type" {
    description = "instance type on ec2 tier"
    default = "t3.micro"
}

variable "disable_api_termination" {
    description = "protect instance by acidental delete"
    type = bool
    default = true
}

# variable "int_names" {
#     description = "Lista de nomes para instancias"
#     type        = list(string)
#     default     = ["-", "-", "-", "-"]

# }

