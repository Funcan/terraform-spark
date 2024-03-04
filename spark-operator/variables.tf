#---------------------------------------------------
# SPARK K8S OPERATOR
#---------------------------------------------------
variable "spark_operator_enabled" {
  description = "Enable Spark on K8s Operator add-on"
  type        = bool
  default     = false
}
