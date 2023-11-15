pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'eu-west-1'
        AWS_ACCESS_KEY_ID = 'ASIAYWLM7DRWA6USHOYA'
        AWS_SECRET_ACCESS_KEY = 'G8QlPb/gkrhiRiaxSt5Vbk1R8Nc5TATheLtRzh+X'
        AWS_SESSION_TOKEN = 'FwoGZXIvYXdzEDgaDC1lPQTkvfMqBkV/5SKGAdGrXLarITb2C/1bbEeBGGtYF7X4HUmcQDV4T8DGz5kxmpFiEu5/oaLTYiby8g+YBWPOfZ0vHECc177PWxvt9U9tejJ4SIEbYlVCFH0o+kLxvOsv6f1Q10cxXGg59h9NVrNhRalGN3L149stpQnph6nxY9ix20BLl0djdkW7g/ZD1sbBYCO3KIjI0aoGMijjela5xoCJRmuc/tYtMXWavOkats1XDS46OSrqOv7CILXwMY9L04+W'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the Terraform script from GitHub
                    checkout scm
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform --version'
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply Terraform changes
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            // Cleanup, e.g., destroy resources if needed
            script {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
