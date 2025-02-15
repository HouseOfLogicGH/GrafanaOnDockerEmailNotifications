# Grafana On Docker Email Notifications

Setup instructions / commands for how to set up Grafana with Email Notifications

A video demonstration of the setup [can be found here.](https://youtu.be/ocgSNhPphUI)

## Prerequisites

Before you set Grafana up to send email notifications, you will need an SMTP Server, or valid credentials to a third party service.

Gmail can be used for this and is referenced in the examples.

Turn on 2 factor authentication in Gmail, and then create an app password [here](https://myaccount.google.com/apppasswords).

To setup Grafana on Docker to send email, run the Docker container with the following commands:
```
sudo docker volume create grafana-storage

sudo docker run -d -p 3000:3000 --name=grafana \
  --volume grafana-storage:/var/lib/grafana \
  -e GF_SMTP_startTLS_policy \
  -e GF_SMTP_ENABLED='true' \
  -e GF_SMTP_HOST='smtp.gmail.com:587' \
  -e GF_SMTP_SKIP_VERIFY='true' \
  -e GF_SMTP_PASSWORD='yourpassword' \
  -e GF_SMTP_USER='yourgmailaddress@domain.com' \
  -e GF_SMTP_FROM_ADDRESS='yourgmailaddress@domain.com' \
  -e GF_SMTP_FROM_NAME='Grafana' \
  grafana/grafana-enterprise
```

  With grafana environment configured, login to Grafana. (Default username and password are both "admin")
  
  Configure a contact point and test that the contact point gets the email before continuing with the Alert Rule setup.
