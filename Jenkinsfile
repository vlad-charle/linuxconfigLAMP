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

        sh 'docker-compose -f docker-compose.yml up -d'
    }

}