pipeline {
  environment {
    JAVA_TOOL_OPTIONS = "-Duser.home=/var/maven"
  }
  agent {
    docker {
      image "maven:3.6.0-jdk-13"
      label "test-server"
      args "-v /tmp/maven:/var/maven/.m2 -e MAVEN_CONFIG=/var/maven/.m2"
    }
  }


  stages {
    stage ("Build") {
      steps {
        sh "ssh -V"
        sh "mvn -version"
        sh "mvn clean install"
      }
    }
  }
}
