pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                sh "echo 'Building....'"
                sh "docker build -t karimaraby/botit-task-src:3.${env.BUILD_NUMBER} ."
            }
        }
        stage('test') {
            steps {
                sh "echo 'Testing....'"
                sh "docker run --name=botit-test karimaraby/botit-task-src:3.${env.BUILD_NUMBER} python ./tests/test_hello.py"
            }
            post {
                failure {
                    mail to: 'karimaraby3344@gmail.com',
                         subject: "Test Stage Failed: ${env.JOB_NAME} Build #${env.BUILD_NUMBER}",
                         body: "The test stage failed in the pipeline for ${env.JOB_NAME} build #${env.BUILD_NUMBER}. Please check the Jenkins console for details."
                 }
             }
        } 
        stage('push'){
            steps{
                sh "echo 'Pushing.....'"
                withCredentials([
                usernamePassword(
                        credentialsId: 'docker-cred', 
                        usernameVariable: 'USER', 
                        passwordVariable: 'PASS'
                    )
                ]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push karimaraby/botit-task-src:3.${env.BUILD_NUMBER}"
               }
            }
        }
        stage('deploy'){
            steps{
                sh "echo Deploying......"
                sh "docker stop hello-botit"
                sh "docker rm botit-test"
                sh "docker rm hello-botit"
                sh "docker run -d -v /home/ec2-user/hello-data/:/var/log -p 5000:5000 --name=hello-botit karimaraby/botit-task-src:3.${env.BUILD_NUMBER}"
            }
        }
    }
}