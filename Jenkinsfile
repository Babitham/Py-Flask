pipeline {
  environment {
    registry = "babitham/py.babitha"
    registryCredential = 'dockerhub_id'
    dockerImage = ''
  }
  agent none
  stages {
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    }
  }
