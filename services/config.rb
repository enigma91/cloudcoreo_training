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

coreo_aws_advisor_elb "advise-elb" do
  action :advise
  alerts ["elb-training-check"]
  regions ${AUDIT_AWS_ELB_REGIONS}
end

coreo_aws_advisor_alert "ec2-training-check" do
  action :define
  service :ec2
  display_name "Ec2 large not encrypted snapshots"
  description "EC2 not encrypted snapshot is greater than 8GB"
  category "Inventory"
  suggested_action "None."
  level "Informational"
  id_map "snapshot_set.snapshot_id"
  objectives ["snapshots", "snapshots"]
  audit_objects ["snapshot_set.volume_size", "snapshot_set.encrypted"]
  operators [">", "=="]
  alert_when [8, false]
end

coreo_aws_advisor_ec2 "advise-ec2" do
  action :advise
  alerts ["ec2-training-check"]
  regions ${AUDIT_AWS_ELB_REGIONS}
end