pipeline {

    agent any
    
    environment {
        PROJECT_ID = 'unique-poetry-309411'
        CLUSTER_NAME = 'devamps'
        LOCATION = 'us-east1-b'
        CREDENTIALS_ID = 'unique-poetry-309411'
    }

    stages {
        stage('Build') {
        steps {
                sh "docker build ."
            }
        }
        stage('Deploy'){
        steps{
                step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'k8s/',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
        }
        }
        }
  
  }