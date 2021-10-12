pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                echo env.BRANCH_NAME
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


