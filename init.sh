#!/bin/bash

if [[ -v RABBITMQ_USER ]]
then
	echo "Create Rabbitmq user";
	# Create Rabbitmq user
	( sleep 5 ; \
	rabbitmqctl add_user $RABBITMQ_ADMIN_USER $RABBITMQ_ADMIN_PASS 2>/dev/null ; \
	rabbitmqctl set_user_tags $RABBITMQ_ADMIN_USER administrator ; \
	rabbitmqctl set_permissions -p / $RABBITMQ_ADMIN_USER  ".*" ".*" ".*" ; \

	rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD 2>/dev/null ; \
	rabbitmqctl set_user_tags $RABBITMQ_USER guest ; \
	rabbitmqctl set_permissions -p / $RABBITMQ_USER  ".*" ".*" ".*" ; \
	echo "*** Admin user is '$RABBITMQ_ADMIN_USER'. ***" ; \
	echo "*** Guest user is '$RABBITMQ_USER' with password '$RABBITMQ_PASSWORD'. ***" ; \
	echo "*** Log in the WebUI at port 15672 (example: http://localhost:15672) ***") & \
	rabbitmq-server
fi