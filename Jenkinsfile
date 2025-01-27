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
                    bat 'docker-compose build'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests using Docker Compose
                    //bat 'docker-compose run app dotnet test /app/MyConsoleApp.Tests/MyConsoleApp.Tests.csproj'
                }
            }
        }

        stage('Run') {
            steps {
                script {
                    // Run the application
                    bat 'docker-compose up -d'
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker containers and images
            bat 'docker-compose down'
        }
    }
}