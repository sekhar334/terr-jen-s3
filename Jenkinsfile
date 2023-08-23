pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AKIA4YR4DHRSDKIG4WNG')
        AWS_SECRET_ACCESS_KEY = credentials('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')
        AWS_DEFAULT_REGION = 'us-east-1' // Modify as needed
        TF_CLI_ARGS = '-input=false -no-color' // Terraform CLI arguments
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout your GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/sekhar334/terr-jen-s3.git']]])
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Create a Terraform plan
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the Terraform plan
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Cleanup') {
            steps {
                // Optionally, you can perform cleanup tasks here
            }
        }
    }

    post {
        always {
            // Archive artifacts, send notifications, or perform other post-build actions here
        }
    }
}
