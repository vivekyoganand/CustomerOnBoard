pipeline {
    agent any
    stages {
        stage('Example Build') {
             
            steps {
                echo 'Hello, Maven'
                sh 'mvn package'
            }
        }
        stage('Example Test') {
            
            steps {
                echo 'Hello, JDK'
                sh 'java -version'
            }
        }
    }
}
