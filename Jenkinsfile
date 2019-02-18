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
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
