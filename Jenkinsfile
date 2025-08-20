pipeline {
    // ИСПРАВЛЕНИЕ ЗДЕСЬ:
    // Мы говорим Jenkins использовать наш Dockerfile как среду для выполнения всех шагов.
    // Это гарантирует, что все нужные инструменты (Java, Docker) будут доступны.
    agent {
        dockerfile true
    }

    stages {
        // Стадия Checkout больше не нужна, так как 'agent { dockerfile true }' делает это автоматически.

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                // Имя образа будет "palindrome-app", а тег - номер сборки
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