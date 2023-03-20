pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "3.9.0"
    }
    stages {
        stage('Build maven') {
            steps {
                // Get some code from a GitHub repository
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Ahmed-Khan-2016/jenkins-pipeline']])

                // Run Maven on a Unix agent.
                bat "mvn clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage("Build docker image") {
            steps {
                script {
                    bat " docker build -t asabk/pipeline-jenkins-test ."
                }
            }
        }
        stage("Push image to docker hub") {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) { 
                        bat " docker login -u asabk -p ${dockerhubpwd}"
                    }
                    bat " docker push asabk/pipeline-jenkins-test"
                }
            }
        }
    }
}
