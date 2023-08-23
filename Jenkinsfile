pipeline {
    agent any
 
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the GitHub repository
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }
 
        stage('Terraform Apply') {
            steps {
                script {
                    // Apply Terraform changes (create S3 bucket)
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
    
    post {
        success {
            stage('Terraform Cleanup') {
                steps {
                    script {
                        // Clean up Terraform workspace after success
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}

