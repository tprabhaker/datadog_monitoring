provider "datadog" {
api_key = var.datadog_api_key
app_key = var.datadog_app_key
}

#CPU monitor
resource "datadog_monitor" "cpu_usage" {
  name               = "High CPU Usage"
  type               = "Metric Alert"
  query              = "avg(last_5m):avg:system.cpu.user{*} > ${var.cpu_threshold}"
  message            = "CPU usage is above ${var.cpu_threshold}, Investigate Immediately"
  escalation_message = "Critical CPU usage alert!"
  thresholds {
      critical = var.cpu_threshold
}
}
# Latency Monitor
  resource "datadog_monitor" "latency" {
    name              = "High Latency"
    type              = "Metric Alert"
    query             = "avg(last_5m):avg.myapp.latency{*} > ${var.latency_threshold}"
    message            = "Latency usage is above ${var.latency_threshold}, Investigate Immediately"
    escalation_message = "Critical latency alert!"
    thresholds {
      critical =var.latency_threshold
  }
}
#500 Errors Monitor
resource "datadog_monitor" "http_500_errors" {
    name              = "High Rate of 500 Errors"
    type              = "Metric Alert"
    query             = "avg(last_5m):avg.myapp.https.500{*} > ${var.http_500_threshold}"
    message            = "Latency usage is above ${var.http_500_threshold}, Investigate Immediately"
    escalation_message = "Critical latency alert!"
    thresholds {
      critical =var.http_500_threshold
  }
}
