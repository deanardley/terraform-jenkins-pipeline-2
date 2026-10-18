pipeline{
    agent any

    parameters{
        choice(name: "ACTION", choices: ['apply', 'destroy'], description: 'Choose action: apply to create resources, destroy to delete them')
    }

    environment{
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account-key')
    }

    stages{
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }

        stage('Terraform Plan'){
            
            steps{
                script{
                    if(params.ACTION == 'apply'){
                        sh 'terraform plan -out=tfplan'
                    }else if(params.ACTION == 'destroy'){
                        sh 'terraform plan -destroy -out=tfplan'
                    }
                }
            }
        }

        stage('Terraform Execute'){
            steps{
                sh 'terraform apply tfplan'
            }
        }
    }

    post{
        always{
            sh 'rm -f tfplan'
        }
    }
}