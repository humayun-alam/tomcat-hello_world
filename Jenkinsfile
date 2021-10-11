pipeline{
  agent any
  stages{
    stage("Git Checkout"){
      steps{
          git branch: 'staging',
            credentialsId: 'github', 
            url: 'https://github.com/humayun-alam/tomcat-hello_world.git'
           }
          }
     stage("Maven Build"){
       steps{
            sh "mvn clean package"
//            sh "mv target/*.war target/myweb.war"
             }
            }
     stage("deploy-dev"){
       steps{
          sshagent (['ssh_root_key']) {
          sh """
          scp -o StrictHostKeyChecking=no target/*.war root@192.168.1.63:/opt/tomcat/latest/webapps
          ssh root@192.168.1.63 systemctl stop tomcat
          ssh root@192.168.1.63 systemctl start tomcat
	  echo "This is staging branchh"
            """
            }
          }
        }
      }
    }
