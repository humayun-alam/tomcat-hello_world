pipeline {
  agent {
    docker {
      image "maven:3.6.0-jdk-13"
      label "test-server"
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
