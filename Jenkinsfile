pipeline {
  agent any
  environment {
    PACKER = tool('packer100')
  }
  tools {
    nodejs 'Node 7.10.0'
  }
  stages {
    stage('Validate') {
      steps {
        sh 'echo ${MAVEN_HOME}'
        sh '${PACKER}/packer -v'
        sh '${PACKER}/packer validate ubuntu-16.04-amd64.json'
        sh 'env'
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts(artifacts: '*.txt', allowEmptyArchive: true, fingerprint: true)
      }
    }
  }
}
