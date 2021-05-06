pipeline {

    agent any
    
    environment {
        DATASTORE = credentials('datastore-creds')
    }

    stages {
        stage('Build') {
        steps {
                sh "docker build ."
            }
        }
        stage('Deploy'){
        steps{
                kubernetesDeploy(configs: "k8s/api-deploy.yml" , kubeconfigId: "gke-config")
                kubernetesDeploy(configs: "k8s/api-service.yml" , kubeconfigId: "gke-config")
                kubernetesDeploy(configs: "k8s/api-ingress.yml" , kubeconfigId: "gke-config")
        }
        }
        }
  
  }