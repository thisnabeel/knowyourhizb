# AWS_CONFIG = {
#   'access_key_id' => "AKIAIJ5BEHVVHQSF2SMQ",
#   'secret_access_key' => "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",
#   'bucket' => 'natadarrab',
#   'acl' => 'public-read',
#   'key_start' => 'uploads/'
# }

AWS_CONFIG = {
  'access_key_id' => ENV["AWS_ACCESS_KEY_ID"],
  'secret_access_key' => ENV["AWS_SECRET_ACCESS_KEY"],
  'bucket' => 'rerecite',
  'region' => ENV["AWS_REGION"],
  'acl' => 'public-read',
  'key_start' => 'uploads/'
}

# AWS SDK v3 configuration
Aws.config.update({
  region: ENV["AWS_REGION"] || 'us-east-1',
  credentials: Aws::Credentials.new(
    ENV["AWS_ACCESS_KEY_ID"],
    ENV["AWS_SECRET_ACCESS_KEY"]
  )
})

# S3 Resource client (compatible with SDK v3)
S3_BUCKET = Aws::S3::Resource.new(region: ENV["AWS_REGION"] || 'us-east-1').bucket('knowyourhizb')