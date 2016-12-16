coreo_aws_advisor_alert "elb-inventory" do
  action :define
  service :elb
  #include_violations_in_count false
  display_name "ELB Object Health Check"
  description "Load balancer health check is greater then 2 min."
  category "Inventory"
  suggested_action "None."
  level "Informational"
  objectives ["load_balancers"]
  audit_objects ["load_balancer_descriptions.health_check.interval"]
  operators [">"]
  alert_when [1]
end

coreo_aws_advisor_elb "advise-elb" do
  alerts ${AUDIT_AWS_ELB_ALERT_LIST}
  action :advise
  regions ${AUDIT_AWS_ELB_REGIONS}
end