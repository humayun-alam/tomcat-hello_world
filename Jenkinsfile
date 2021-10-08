pipeline {
   agent {
    docker {
      image "humayunalam/tomcat-maven"
      args '-v $HOME/.m2:/root/.m2'
      reuseNode true
      label "test-server"
    }
  }

  stages {
    stage ("Build") {
      steps {
        sh 'mvn -B'
      }
    }
  }
}
