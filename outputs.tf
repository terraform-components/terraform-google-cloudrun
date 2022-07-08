output "network_endpoint_group_id" {
  value       = google_compute_region_network_endpoint_group.main.id
  description = "ID of the regional Serverless Network Endpoint Group, that can be used with Cloud Load Balancing"
}
