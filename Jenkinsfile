pipeline {
    agent any
    stages {
        stage('Git checkout') {
          steps{
          git branch: 'staging',
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
                branch 'staging'
            }
<<<<<<< HEAD
     stage("deploy-dev"){
       steps{
          sshagent (['ssh_root_key']) {
          sh """
          scp -o StrictHostKeyChecking=no target/*.war root@192.168.1.80:/opt/tomcat/latest/webapps
          ssh root@192.168.1.80 systemctl stop tomcat
          ssh root@192.168.1.80 systemctl start tomcat
	  echo "this is main branch"
            """
=======
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
                branch 'staging'
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
>>>>>>> staging
            }
        }
    }
}
