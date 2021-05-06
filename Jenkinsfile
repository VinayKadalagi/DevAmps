pipeline {

    agent any
    
    environment {
        PROJECT_ID = 'unique-poetry-309411'
        CLUSTER_NAME = 'devamps'
        LOCATION = 'us-east1-b'
        CREDENTIALS_ID = 'unique-poetry-309411'
        GCR_CREDS = credentials('gcr-creds')
    }

    stages {
        stage('Docker build & Push') {
        steps {
                sh "docker build -t asia.gcr.io/unique-poetry-309411/gcf/devamps:1.0.3 ."
                sh "cat ${GCR_CREDS} | docker login -u _json_key --password-stdin https://asia.gcr.io"
                sh "docker push asia.gcr.io/unique-poetry-309411/gcf/devamps:1.0.3"
            }
        }

        stage('Deploy'){
        steps{
                step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'k8s/*',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
        }
        }
        }
  
  }