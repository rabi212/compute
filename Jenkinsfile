pipeline {
    agent any

    environment {
        GIT_TOKEN = credentials('git-token')
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: "https://${GIT_TOKEN}@github.com/rabi212/compute.git"
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Manual Approval') {
            steps {
                input "Approve?"
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply tfplan'
                }
            }
        }
    }

    post {
        cleanup {
            cleanWs()
        }
    }
}
