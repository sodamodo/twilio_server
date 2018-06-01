project ID norcalphone-205821
region:

gcloud auth login
gcloud container clusters get-credentials norcal-cluster --zone us-west1-a --project norcalphone-205821
gcloud config set project norcalphone-205821

docker build --tag grc.io/norcalphone-205821/twilio_server .
docker run grc.io/giscontainer/twilio_server

docker run grc.io/norcalphone-205821/twilio_server:latest
gcloud auth configure-docker

docker tag collector gcr.io/norcalphone-205821/twilio_server:latest
gcloud docker -- push gcr.io/norcalphone-205821/twilio_server:latest

kubectl apply -f twilio-deployment.yaml
kubectl apply -f twilio-service.yaml
