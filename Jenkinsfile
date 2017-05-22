pipeline {
  agent any
  stages {
    stage('Validate') {
      steps {
        sh '''packer -v
echo "Hello World" > hello.txt
date > date.txt'''
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts(artifacts: '/*.txt', allowEmptyArchive: true, fingerprint: true)
      }
    }
  }
}