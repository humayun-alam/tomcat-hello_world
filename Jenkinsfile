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
        
	sh "mkdir /var/maven"
	sh "cd /var/maven"
	sh "curl -SL  http://www-eu.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz | tar -xz"
	sh " mv apache-maven-3.5.4 maven"
	sh "mvn -version"
        sh "mvn clean install"
      }
    }
  }
}
