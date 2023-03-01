pipeline {
    agent any 
    tools {
        maven 'Maven_Home'
    
    }
    stages {
        stage('Compile and Clean') { 
            steps {
                      
                sh 'mvn clean compile -DskipTests'
            }
        }
        stage('deploy') { 
            
            steps {
                sh 'mvn package -DskipTests'
            }
        }
        stage('Build Docker image'){
          
            steps {
                echo "Hello Java Express"
                sh 'ls'
                sh 'docker build -t  anandebix/docker_jenkins_springboot:${BUILD_NUMBER} .'
            }
        }
        stage('Docker Login'){
            
            steps {
                 withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerpwd')]) {
                      sh 'docker login -u anandebix -p ${dockerpwd}'
                }
            }                
        }
        stage('Docker Push'){
            steps {
                sh 'docker push anandebix/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        stage('Docker deploy'){
            steps {
               
                sh 'docker run -itd -p  8081:8080 anandebix/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}