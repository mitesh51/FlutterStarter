pipeline {
  agent any
  stages {
    stage('SCA') {
      steps {
        bat 'flutter analyze'
      }
    }

    stage('Test') {
      steps {
        bat 'flutter test'
      }
    }

    stage('Build') {
      steps {
        bat 'flutter build apk --debug'
        archiveArtifacts '**/*.apk'
      }
    }

  }
}