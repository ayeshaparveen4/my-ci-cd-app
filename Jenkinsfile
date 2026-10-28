pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application Docker image'

                sh 'docker build --target app -t my-ci-cd-app:${BUILD_NUMBER} .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests'

                sh 'docker build --target test -t my-ci-cd-app-test .'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application'

                sh '''
                    docker rm -f my-ci-cd-app || true

                    docker run -d \
                      --name my-ci-cd-app \
                      --restart unless-stopped \
                      -p 8000:8000 \
                      my-ci-cd-app:${BUILD_NUMBER}
                '''
            }
        }
    }

    post {
        success {
            echo 'Build, Test and Deploy completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}