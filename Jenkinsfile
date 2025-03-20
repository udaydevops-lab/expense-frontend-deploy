pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version?')
        string(name: 'ACTION', defaultValue: 'apply', description: 'Specify action: apply or destroy')
    }
    environment{
        def appVersion = '' //variable declaration
        nexusUrl = 'nexus.prajai.online:8081'
    }
    stages {
        stage('print the version'){
            steps{
                script{
                    echo "Application version: ${params.appVersion}"
                }
            }
        }
        stage('Init'){
            steps{
                sh """
                    cd terraform
                    terraform init
                """
            }
        }
        stage('Plan'){
            steps{
                sh """
                    pwd
                    cd terraform
                    terraform plan -var="app_version=${params.appVersion}"
                """
            }
        }

        stage('Deploy'){
            when {
                expression { params.ACTION == 'apply' }
            }
            steps{
                sh """
                    cd terraform
                    terraform apply -auto-approve -var="app_version=${params.appVersion}"
                """
            }
        }

        stage('Destroy'){
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps{
                sh """
                    cd terraform
                    terraform destroy -auto-approve -var="app_version=${params.appVersion}"
                """
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}