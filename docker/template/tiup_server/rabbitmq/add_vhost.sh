#!/usr/bin/env bash
rabbitmqctl add_vhost datacenter_host
rabbitmqctl add_user tiup tiup
rabbitmqctl set_permissions -p "datacenter_host" tiup ".*" ".*" ".*"
