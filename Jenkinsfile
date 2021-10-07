pipeline {
  environment {
    JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
  }
  agent {
    dockerfile {
      label "test-server"
      args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/home/jenkins/.m2"
    }
  }


  stages {
    stage ("Build") {
      steps {
        
	sh "mvn -version"
        sh "mvn clean install"
      }
    }
  }
}
