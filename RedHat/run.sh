# Run Container
docker run -it --rm --name rh \
  --mount source=redhat_persistent_data,target=/data \
  --mount source=redhat_user_configs,target=/root \
  --mount source=redhat_system_config,target=/etc \
  --mount source=redhat_var_data,target=/var \
  rh206147:0
