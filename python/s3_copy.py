import boto3

# Creating Session With Boto3.
session = boto3.Session(
    aws_access_key_id='AKIAQBVYBRYXSH337H63',
    aws_secret_access_key='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'
)

# Creating S3 Resource From the Session.
s3 = session.resource('s3')

srcbucket = s3.Bucket('abbvie-edl')

destbucket = s3.Bucket('test.dataset')

# Iterate All Objects in Your S3 Bucket Over the for Loop
for file in srcbucket.objects.all():

    # Create a Source Dictionary That Specifies Bucket Name and Key Name of the Object to Be Copied
    copy_source = {
        'Bucket': 'abbvie-edl',
        'Key': file.key
    }

    destbucket.copy(copy_source, file.key)

    print(file.key + '- File Copied')
