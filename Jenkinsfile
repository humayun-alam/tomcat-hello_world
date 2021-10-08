pipeline {

  stages {
    stage ('Building') {
      steps {
        sh '''
        docker run -i -v ./:/src -w /src 229703e16d76  /bin/bash -c "mvn -V" 
        '''
      }
    }
  }
}
