# Replace your follow with a List in Twitter. 
Require [Twitter Ruby Gem](https://github.com/sferik/twitter)

## On Windows 10 Require set SSL_CERT_FILE in PATH

If you run this script in Windows, setting PATH SSL_CERT_FILE=/Users/<user_name>/cacert.pem

Because default CA authentification file path is setted not existed folder, it is hardcoded DLL the developer user folder path.
Http client gem has this bug some version.

## ThisScript
Replace Follow with a List member.  
Prepare API key on Twitter, set API key and List slug in config.yaml.
