pipeline {
  agent any
  environment {
    PACKER_TOOL = tool('packer100')
  }
  tools {
    nodejs 'Node 7.10.0'
  }
  stages {
    stage('Validate') {
      steps {
        sh 'echo ${MAVEN_HOME}'
        sh 'packer -v'
        sh 'npm --version'
        sh 'packer validate ubuntu-16.04-amd64.json'
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
