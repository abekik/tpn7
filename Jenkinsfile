pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'tpn7'
        DOCKER_IMAGE_TAG = 'ver1.0'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                  
                    sh "docker build -t \${DOCKER_IMAGE_NAME}:\${DOCKER_IMAGE_TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                
                    sh "docker run -d -p 9090:80 --name tpn7 \${DOCKER_IMAGE_NAME}:\${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
stage('Test Docker Container') {
            steps {
                script {
                    // Copiar el archivo index al contenedor
                    sh "lynx 192.168.56.10:9090"


                }
            }
        }
    }
    post {
        success {
            echo 'Imagen Docker construida y contenedor en ejecución exitosamente.'
        }
        failure {
            error 'Error al construir la imagen Docker o ejecutar el contenedor.'
        }
    }
}
