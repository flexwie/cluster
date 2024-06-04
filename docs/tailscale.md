# Tailscale

## Operator Setup

Adjust the ACLs and add the following tags

```json
"tagOwners": {
    "tag:automated":    [],
    "tag:terraform":    ["tag:automated", "autogroup:admin"],
    "tag:k8s-operator": ["tag:automated", "autogroup:admin"],
    "tag:k8s":          ["tag:k8s-operator", "tag:automated"],
    "tag:k8s-admin":    [],
}
```

Create a OAuth client with the tag `tag:automated`.
Assign the tag `tag:k8s-admin` to all nodes that should have superuser rights on the cluster.
