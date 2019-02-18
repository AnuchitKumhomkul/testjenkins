pipeline {
  environment {
    registry = "kowoatz/anuchit"
    registryCredential = 'kowoatz'
    dockerImage = ''
  }

  agent any

  stages {
    stage('Cloning git') {
      steps {
        git  'https://github.com/AnuchitKumhomkul/testjenkins.git'
      }
    }

    stage('Building image') {
      steps {
        script {
          img = docker.build registry
        }
      }
    }

    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
              img.push("${BUILD_NUMBER}")
              img.push("latest")
          }
        }
      }
    }
  }
}
