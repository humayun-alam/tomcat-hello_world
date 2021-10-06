pipeline{
  agent any
  stages{
    stage("Git Checkout"){
      steps{
          git branch: 'main',
            credentialsId: 'github', 
            url: 'https://github.com/humayun-alam/tomcat-hello_world.git'
           }
          }
     stage("Maven Build"){
       steps{
            sh "mvn clean package"
            sh "mv target/*.war target/myweb.war"
             }
            }
     stage("deploy-dev"){
       steps{
          sshagent(credentials : ['webserver_login']) {
          sh """
          scp -o StrictHostKeyChecking=no target/myweb.war root@192.168.1.80:/tmp
          ssh root@192.168.1.80 /opt/tomcat/latest/bin/shutdown.sh
          ssh root@192.168.1.80 /opt/tomcat/latest/bin/startup.sh
            """
            }
          }
        }
      }
    }
