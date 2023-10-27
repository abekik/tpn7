pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'nombre_del_contenedor' // Personaliza el nombre de la imagen
        DOCKER_IMAGE_TAG = "${BUILD_NUMBER}" // Utiliza el número de compilación como etiqueta
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

