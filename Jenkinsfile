pipeline {
  agent any
  tools {
    nodejs 'Node 7.10.0'
    packer 'packer100'
  }
  stages {
    stage('Validate') {
      steps {
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
