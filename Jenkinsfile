pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'tpn7' 
        DOCKER_IMAGE_TAG = "1.0" 
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                        docker build -t \${DOCKER_IMAGE_NAME}:\${DOCKER_IMAGE_TAG} .
                    """
                }
            }
        }
    }
}

