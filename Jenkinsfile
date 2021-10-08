pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
                sh "hostname"
                sh """
                mkdir /opt/tomcat/
                cd /opt/tomcat
                curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz
                tar xvfz apache*.tar.gz
                mv apache-tomcat-8.5.72/* /opt/tomcat/.
                yum -y install java
                java -version
                   """
            }
        }
    }
}
