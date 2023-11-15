pipeline {
    agent any
    stages {
        stage("verify tools") {
            steps {
                sh '''
                docker version
                docker compose version
                docker info
                curl --version
                jq --version
                '''
            }
        }
    }
}