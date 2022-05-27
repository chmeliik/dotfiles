# delete lines that start with #
/^#/d
# remove comments preceeded by whitespace
s/\s\s*#.*//
# delete empty lines
/^$/d
