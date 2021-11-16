#!/bin/bash

# usage -
# $1 = subscription
# $2 = vars folder
#

FLAGS=${1:-}

# delete .terraform folder
rm -Rf .terraform

# execute tf init
terraform-13 init

## run plan - by default TF runs with 10 parallel threads, this causes the TF API rate limit to be hit. By switching this to 2 we slow down the rate of requests to something managable (though very, very slow)
#TF_LOG=debug TF_LOG_PATH=./tf.log terraform plan -parallelism=1 -out plan.tfplan $FLAGS
terraform-13 plan -out plan.tfplan $FLAGS