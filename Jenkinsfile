pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'tpn7'
        DOCKER_IMAGE_TAG = 'ver1.1'
        
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
                    // Construir la imagen Docker
                    sh "docker build -t \${DOCKER_IMAGE_NAME}:\${DOCKER_IMAGE_TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Ejecutar el contenedor Docker
                    sh "docker run -d -p 9090:80 --name tpn7 \${DOCKER_IMAGE_NAME}:\${DOCKER_IMAGE_TAG}"
                }
            }
        }

        stage('Test Docker Container') {
            steps {
                script {

                    sh "cat /var/www/html/index.html"
                    sh "curl -I http://192.168.56.10:9090/index.html"
                }
            }
        }
    
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Iniciar sesión en Docker Hub
                    sh "docker login -u \${DOCKERHUB_USERNAME}"

                    // Etiquetar la imagen con el nombre de usuario/organización en Docker Hub
                    sh "docker tag \${DOCKER_IMAGE_NAME}:\${DOCKER_IMAGE_TAG} \${DOCKERHUB_USERNAME}/\${DOCKER_IMAGE_NAME}:\${DOCKER_IMAGE_TAG}"

                    // Cargar (push) la imagen a Docker Hub
                    sh "docker push \${DOCKERHUB_USERNAME}/\${DOCKER_IMAGE_NAME}:\${DOCKER_IMAGE_TAG}"
                }
            }
        }

    }

    post {
        success {
            echo 'Imagen Docker construida, contenedor en ejecución y prueba de acceso a la página web exitosa.'
        }
        failure {
            error 'Error al construir la imagen Docker, ejecutar el contenedor o realizar la prueba de acceso a la página web.'
        }
    }
}
