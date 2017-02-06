# Encrypted Environment Variables Example
Example of how to encrypt contents of an environment file, line by line, and decrypting using PKI. 

Use case: Multiple devop teams needs to be able to set secret environment variables, like database credentials. Only the deployment system should be able to decrypt the secrets and set them as environment variable when deploying the application.  

Note: This is just an inspirational example. It's not intended to be a complete solution in any way. In this example we keep both keys together, but the whole point is to separate them. 

### Create key pair
This will create a key pair and store it the "keys" directory.
docker-compose run --entrypoint eyaml secenv createkeys

### Add an encrypted variable to an existing envir file
docker-compose run secenv -f envir/myapp.env -k VAR_NAME -v "My secret value"

### Read an environment file and decrypt all encrypted values
docker-compose run secenv -d -f envir/myapp.env