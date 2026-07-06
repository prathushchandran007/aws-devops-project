pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('app') {
                    sh 'docker build -t aws-devops-project:latest .'
                }
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 559846026467.dkr.ecr.ap-south-1.amazonaws.com

                docker tag aws-devops-project:latest 559846026467.dkr.ecr.ap-south-1.amazonaws.com/aws-devops-project:latest

                docker push 559846026467.dkr.ecr.ap-south-1.amazonaws.com/aws-devops-project:latest
                '''
            }
        }

        stage('Deploy to ECS') {
            steps {
                sh '''
                aws ecs update-service \
                --cluster aws-devops-cluster \
                --service aws-devops-service \
                --force-new-deployment
                '''
            }
        }

    }
}
