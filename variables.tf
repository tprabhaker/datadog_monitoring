variable "datadog_api_key" {}
variable "datadog_app_key" {}
variable "cpu_usage_threshold" {
   default = "80"
}
variable "latency_threshold" {
  default = "200"
}
  variable "http_500_threshold" {
    default = "5"
  }
