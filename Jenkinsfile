node {
    def app

    stage('Clone repository') {

        checkout scm
    }

    stage('Build image') {

        app = docker.build("vladsanyuk/ssdevopscc")
    }

    stage('Push image') {

        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            app.push("php-httpd")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }

    stage('Deploy') {

        kubernetesDeploy(configs: "k8s/lamp-secret.yaml", kubeconfigId: '')
        kubernetesDeploy(configs: "k8s/mariadb-configmap.yaml", kubeconfigId: '')
        kubernetesDeploy(configs: "k8s/mariadb.yaml", kubeconfigId: '')
        kubernetesDeploy(configs: "k8s/phpmyadmin.yaml", kubeconfigId: '')
        kubernetesDeploy(configs: "k8s/php-httpd.yaml", kubeconfigId: '')
    }

}