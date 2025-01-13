variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(number)
  default     = [22, 3389]
}