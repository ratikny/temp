pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning the repository...'
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                // ИСПРАВЛЕНИЕ ЗДЕСЬ: одинарные кавычки заменены на двойные
                sh "docker build -t palindrome-app:${env.BUILD_NUMBER} ."
            }
        }
        stage('Run Test') {
            steps {
                echo 'Running the test...'
                sh "echo 'level' | docker run --rm palindrome-app:${env.BUILD_NUMBER} | grep 'This is palindrome'"
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}