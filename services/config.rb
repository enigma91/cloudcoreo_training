coreo_aws_advisor_alert "elb-training-check" do
  action :define
  service :elb
  #include_violations_in_count false
  display_name "ELB Object Health Check"
  description "Load balancer health check is greater then 1 sec."
  category "Inventory"
  suggested_action "None."
  level "Informational"
  objectives ["load_balancers"]
  audit_objects ["load_balancer_descriptions.health_check.interval"]
  operators [">"]
  alert_when [1]
end

coreo_aws_advisor_alert "ec2-training-check" do
  action :define
  service :ec2
  #include_violations_in_count false
  display_name "Ec2 large not encrypted snapshots"
  description "EC2 not encrypted snapshot is greater than 8GB"
  category "Inventory"
  suggested_action "None."
  level "Informational"
  objectives ["snapshots"]
  audit_objects ["snapshot_set.volume_size", "snapshot_set.encrypted"]
  operators [">", "="]
  alert_when [8, false]
end

coreo_aws_advisor_elb "advise-elb" do
  alerts ["elb-training-check", "ec2-training-check"]
  action :advise
  regions ${AUDIT_AWS_ELB_REGIONS}
end