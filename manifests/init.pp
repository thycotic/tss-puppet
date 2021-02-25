# 
# Integrates with Thycotic Secrets
#
# @param metadata
#    Boolean value to determine if we want to return the metadata for a secret
#
# @param storage_name
#   Specifies the filename where the file will be installed (inside /tmp)


class thycotic_tss(
  Boolean $metadata = false,
) {}
