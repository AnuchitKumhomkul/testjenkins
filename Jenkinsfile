 def notifyLINE(status) {
  def token = "rIxfHJHexQAMli8E4rhETrEKWqrVlTazDyY7xl0jkYJ"
  def jobName = env.JOB_NAME +' '+env.BRANCH_NAME
  def buildNumber = env.BUILD_NUMBER

  def url = 'https://notify-api.line.me/api/notify'
  def message = "${jobName} Build #${buildNumber} ${status} \r\n"
  sh "curl ${url} -H 'Authorization: Bearer ${token}' -F 'message=${message}'"
}

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
    post{
      success{
        notifyLINE("Succeed")
      }
      failure{
        notifyLINE("Failed")
      }
    }
  }
}
