pipeline {
    // Указываем, что все шаги будут выполняться в среде, где есть Docker
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Шаг 1: Скачиваем код из твоего GitHub репозитория
                echo 'Cloning the repository...'
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                // Шаг 2: Собираем Docker-образ по инструкциям из Dockerfile
                // Имя образа будет "palindrome-app", а тег - номер сборки в Jenkins
                echo 'Building the Docker image...'
                script {
                    docker.build("palindrome-app:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Run Test') {
            steps {
                // Шаг 3: Запускаем тест!
                echo 'Running the test...'
                // Мы запускаем наш контейнер, через "echo" подаем ему на вход слово "level",
                // а затем с помощью "grep" проверяем, что в выводе есть строка "This is palindrome"
                sh "echo 'level' | docker run --rm palindrome-app:${env.BUILD_NUMBER} | grep 'This is palindrome'"
            }
        }
    }
    post {
        // Этот блок выполняется всегда после всех шагов
        always {
            // Сообщаем о результате
            echo 'Pipeline finished.'
        }
    }
}