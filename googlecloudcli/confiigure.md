# Install gcloud CLI on Ubuntu
Run these commands in your Ubuntu terminal:
```
sudo apt-get update
sudo apt-get install -y ca-certificates gnupg curl

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
  | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update
sudo apt-get install -y google-cloud-cli
```
# Verify installation:
```
gcloud --version
```
# Authenticate your laptop to GCP
```
gcloud init
gcloud auth application-default login
gcloud config set project trst-score
```
# Check your account and project:
```
gcloud auth list
gcloud config get-value project
gcloud projects describe trst-score
```
