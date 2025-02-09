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