pipeline {
   agent {
    docker {
      image "humayunalam/tomcat-maven"
      reuseNode true
      label "test-server"
    }
  }

  stages {
    stage ("Build") {
      steps {
        sh "mvn -version"
      }
    }
  }
}
