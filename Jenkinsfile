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
            sh '-n jenkins apply -f k8s/lamp-secret.yaml'
            sh '-n jenkins apply -f k8s/mariadb-configmap.yaml'
            sh '-n jenkins apply -f k8s/mariadb.yaml'
            sh '-n jenkins apply -f k8s/php-httpd.yaml'
            sh '-n jenkins apply -f k8s/phpmyadmin.yaml'
        }
      }
    }
  }
}