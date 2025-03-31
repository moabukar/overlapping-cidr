# VPC Overlapping CIDRs

## Setup

```bash
tf init
tf plan
tf apply --auto-approve

ssh -i ~/.ssh/test-key-pair.pem ec2-user@<VM-A Public IP>
```