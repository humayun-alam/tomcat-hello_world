pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh 'mvn clean package'
                
            }
        }
        stage('DeployToStaging') {
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
                                        sourceFiles: 'target/helloworld.war',
                                        removePrefix: 'target/',
                                        remoteDirectory: '/tmp',
                                       
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
