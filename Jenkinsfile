pipeline {
  agent any
  stages {
    stage('Validate') {
      steps {
        echo 'Print Packer version'
        sh 'packer -v'
        sh 'packer validate ubuntu-16.04-amd64.json'
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts(artifacts: '*.txt', allowEmptyArchive: true, fingerprint: true)
      }
    }
  }
}
