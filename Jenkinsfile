pipeline {
  agent any
  environment {
    PACKER = tool('packer100')
  }
  parameters {
    string(name: 'PACKER_FILE', defaultValue: 'packer.json')
  }
  tools {
    nodejs 'Node 7.10.0'
  }
  stages {
    stage('Pre-Start') {
      steps {
        sh 'printenv'
        sh '${PACKER}/packer -v'
        echo 'Packer File: ${params.PACKER_FILE}'
      }
    }
    stage('Validate') {
      steps {
        sh '${PACKER}/packer validate ubuntu-16.04-amd64.json'
      }
    }
    stage('Build') {
      steps {
        sh '${PACKER}/packer build ubuntu-16.04-amd64.json'
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts(artifacts: '*.txt', allowEmptyArchive: true, fingerprint: true)
      }
    }
  }
}
