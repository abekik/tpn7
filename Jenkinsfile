pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Definir el nombre y la etiqueta de la imagen
                    def imageName = 'nombre_de_tu_imagen'
                    def imageTag = 'etiqueta_de_tu_imagen'

                    // Construir la imagen Docker
                    sh "docker build -t ${imageName}:${imageTag} ."
                }
            }
        }
    }
}

