pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Definir el nombre y la etiqueta de la imagen
                    def imageName = "tpn7"
                    def imageTag = "ver1.0"

                    // Construir la imagen Docker
                    sh "docker build -t ${imageName}:${imageTag} ."
                }
            }
        }
    }
}
stage('Run Docker Container') {
    steps {
        script {
            sh """
                docker run -d -p 8080:80 \${imageName}:\${imageTag}
            """
        }
    }
}
