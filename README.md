# g-ball

## Prerequisites
- You'll need Terraform, AWS CLI installed and configured. Assuming that you already exported your access keys locally.
Check this using `aws sts get-caller-identity`.

- First, you need to create an S3 Bucket to store the terraform state file and attach a policy to it.
- If you need to have a mechanism that will lock the state if its currently being used by other users 
you can achieve this by create an by creating a DynamoDB table for Terraform (commented)
You can list buckets through AWS CLI using  `aws s3 list`.

TAGs defined in locals.tf.

Includes
- EC2 instance with nginx via remote-exec provisioner.
- A key pair by Terraform included in keypair.tf file. A .pem file will be generated locally.



