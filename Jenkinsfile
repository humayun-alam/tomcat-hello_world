node {
  stage('Getting ready...') {
    git branch: "main", credentialsId: 'github', url: 'https://github.com/humayun-alam/tomcat-hello_world.git'
  }
stage('Build'){
  script{
    try {
      if(isUnix()){
          sh 'mvn clean package'
      }else{
       bat 'mvn clean package'
      }
    } catch(err) {
    throw err
    }
   }
}

stage('SSH transfer') {
 script {
  sshPublisher(
   continueOnError: false, failOnError: true,
   publishers: [
    sshPublisherDesc(
     configName: "${env.SSH_CONFIG_NAME}",
     verbose: true,
     transfers: [
      sshTransfer(
       sourceFiles: "${target}/${helloworld.war}",
       removePrefix: "${/opt/tomcat/latest/webapps}",
       remoteDirectory: "${/opt/tomcat/latest/webapps}",
       execCommand: "run commands after copy?"
      )
     ])
   ])
 }
}

stage('Deploy'){
  if(currentBuild.currentResult == "SUCCESS" || currentBuild.currentResult == "UNSTABLE"){
    if (isUnix()) {
      sh 'echo "Build Succeded."'
      }else{
        bat 'echo "Build Succeded."'
      }
     }
    }
