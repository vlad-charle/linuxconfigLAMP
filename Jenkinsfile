pipeline {

  agent any

  stages {

    stage('Deploy App') {
      steps {

          withCredentials([file(credentialsId: 'mykubeconfig', variable: 'KUBECONFIG')]) {
            sh 'kubectl apply -f lamp-secret.yaml'
            sh 'kubectl apply -f mariadb.yaml'
        }
      }
    }
  }
}