# Online-boutique-terraform

This project is a demonstration of how to set up
the [Online Boutique microservices demo](https://github.com/GoogleCloudPlatform/microservices-demo)
using Google Cloud Platform and Terraform. Make sure you have Terraform, kubectl and Google Cloud SDK installed, and you
are authenticated in your Google Cloud SDK. Also make sure these APIs are enabled in your GCP project: Compute Engine,
Kubernetes Engine, and Google Cloud Operations (Monitoring, Cloud Trace, Cloud Debugger, and Cloud Profiler).

Start by filling in your project ID and region in terraform.tfvars

Provision the GKE cluster by running:
````shell
terraform init
terraform apply
````

Get the necessary Kubernetes Cluster credentials:
````shell
gcloud container clusters get-credentials --project=<YOUR-PROJECT-ID> --region=<YOUR-REGION> <YOUR-PROJECT-ID>-gke-cluster
````

Deploy the application:
````shell
kubectl apply -f kubernetes-manifests.yaml
````

Check the status of the pods:
````shell
kubectl get pods
````

Once they are all ready, find the external IP of the application:
````shell
kubectl get service frontend-external
````

Use this IP address to access the website in your browser.