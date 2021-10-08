pipeline {
    agent any
  stages {
    stage ('Building') {
      steps {
        sh '''
        docker run -i  229703e16d76  /bin/bash -c "mvn -V" 
        '''
      }
    }
  }
}
