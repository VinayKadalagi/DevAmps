pipeline {

    agent any
    
    environment {
        DATASTORE = credentials('datastore-creds')
    }

    stages {
        stage('Build') {
        steps {
                sh "docker build --build-arg CREDS=${DATASTORE} ."
            }
        }
        }
  
  }