pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps{
        script {
          checkout scm
        }
      }
    }

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