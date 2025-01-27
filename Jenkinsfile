pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'our-dotnet-console-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git 'https://github.com/salman1256/ourcapp.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    docker 'docker-compose build'
                }
            }
        }

       

        stage('Run') {
            steps {
                script {
                    // Run the application
                    docker 'docker-compose up -d'
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker containers and images
            docker 'docker-compose down'
        }
    }
}