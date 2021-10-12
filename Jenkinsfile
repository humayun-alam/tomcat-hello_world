pipeline {
    agent any
    stages {
        stage('Git checkout') {
          steps{
          git branch: 'main',
          credentialsId: 'github', 
            url: 'https://github.com/humayun-alam/tomcat-hello_world.git'
          }
        }
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh 'mvn clean package'
            }
        }
        stage('DeployToStaging') {
            when {
                branch 'main'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'webserver_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'staging',
                                sshCredentials: [
                                    username: "$USERNAME",
                                    encryptedPassphrase: "$USERPASS"
                                ], 
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'target/*.war',
                                        removePrefix: 'target/',
                                        remoteDirectory: '/opt/tomcat/latest/webapps',
                                        execCommand: 'sudo systemctl start tomcat'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        }
        stage('DeployToProduction') {
            when {
                branch 'main'
            }
            steps {
                input 'Does the staging environment look OK?'
                milestone(1)
                withCredentials([usernamePassword(credentialsId: 'webserver_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'production',
                                sshCredentials: [
                                    username: "$USERNAME",
                                    encryptedPassphrase: "$USERPASS"
                                ], 
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'target/*.war',
                                        removePrefix: 'target/',
                                        remoteDirectory: '/opt/tomcat/latest/webapps',
                                        execCommand: 'sudo systemctl start tomcat'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        }
    }
}

