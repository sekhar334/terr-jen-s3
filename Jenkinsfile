pipeline {
    agent any
    
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'  // Change to your desired region
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
                    def tfCli = "${tfHome}/bin/terraform"
                    sh "${tfCli} init"
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
                    def tfCli = "${tfHome}/bin/terraform"
                    sh "${tfCli} apply -auto-approve"
                }
            }
        }
    }
    
    post {
        always {
            script {
                def tfHome = tool name: 'Terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
                def tfCli = "${tfHome}/bin/terraform"
                sh "${tfCli} destroy -auto-approve"  // Cleanup resources after the job
            }
        }
    }
}
