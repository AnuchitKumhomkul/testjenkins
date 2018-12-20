pipeline {
  environment {
    registry = "kowoatz/kowoatz"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }

  agent any

  stage {
    stage('Cloning git') {
      steps {
        git  ''
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