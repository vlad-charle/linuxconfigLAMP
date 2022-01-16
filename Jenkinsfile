pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/vlad-charle/linuxconfigLAMP.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build("vladsanyuk/ssdevopscc:php-httpd")
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy App') {
      steps {

          withCredentials([file(credentialsId: 'mykubeconfig', variable: 'KUBECONFIG')]) {
            sh 'kubectl apply -n jenkins -f lamp-secret.yaml'
            sh 'kubectl apply -n jenkins -f mariadb-configmap.yaml'
            sh 'kubectl apply -n jenkins -f mariadb.yaml'
            sh 'kubectl apply -n jenkins -f php-httpd.yaml'
            sh 'kubectl apply -n jenkins -f phpmyadmin.yaml'
        }
      }
    }
  }
}