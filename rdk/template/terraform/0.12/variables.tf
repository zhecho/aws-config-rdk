variable "rule_name" {
	type = string
	description = "Rule name to export."
}


variable "source_runtime" {
	type = string
	description = "Runtime for lambda function."
}


variable "source_handler" {
	type = string
	description = "Rule name to export."
}


variable "source_bucket" {
	type = string
	description = "Amazon S3 bucket used to export the rule code."
}


variable "subnet_ids" {
	description = "Comma-separated list of Subnets to deploy your Lambda function(s)."
	type = list(string)
	default=[]
}


variable "security_group_ids" {
	description = "Comma-separated list of Security Groups to deploy with your Lambda function(s)."
	type = list(string)
	default=[]
}


variable "source_events" {
	description = "Resource types that will trigger event-based Rule evaluation."
	type = list(string)
}


variable "source_input_parameters" {
	description = "JSON for required and optional Config parameters."
	type = string
}


variable "lambda_layers" {
	type = list(string)
	description = "Comma-separated list of Lambda Layer ARNs to deploy with your Lambda function(s)."
}


variable "source_periodic" {
	description = "Maximum execution frequency for scheduled Rules."
	type = string
}


variable "lambda_role_arn" {
	description = "Assign existing iam role to lambda functions. If omitted, new lambda role will be created."
	type = string
}

locals {
  event_triggered = (length(var.source_events)>0 ? true : false)
  periodic_triggered = var.source_periodic != "NONE" ? true : false
  create_new_lambda_role = (var.lambda_role_arn == "NONE" ? true : false)
  rule_name_source = format("%s.zip", var.rule_name)

}
