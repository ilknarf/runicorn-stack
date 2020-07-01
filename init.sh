#!/bin/bash

set -a
source ./config.env
set +a

terraform init \
    -backend-config="bucket=${TF_VAR_tf_bucket_name}" \
    -backend-config="key=${TF_VAR_state_key}" \
    -backend-config="region=${TF_VAR_region}"
