pipeline{
    agent any
    tools{
        maven 'Maven_Home'
    }
    stages{
        stage('Checkout and Build '){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/annadalok/restapi-jenkins.git']])
                     sh 'mvn clean install -DskipTests'
                }
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t anandebix/devops-integration-4 .'
                }
            }
        }
        stage('push image to docker hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerpwd')]) {
                      sh 'docker login -u anandebix -p ${dockerpwd}'
                    }
                    sh 'docker push anandebix/devops-integration-4' 
                }
            }
        }
    }
}