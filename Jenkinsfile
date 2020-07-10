pipeline {
  agent any
  stages {
    stage('SCA') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          bat 'flutter analyze'
        }

      }
    }

    stage('Test & Coverage') {
      steps {
        bat 'flutter pub get && flutter pub global activate junitreport && flutter test --machine | tojunit --output test.xml'
        junit 'test.xml'
        bat 'flutter test --coverage &&  python C:\\Python38\\Lib\\site-packages\\lcov_cobertura.py coverage\\lcov.info'
        publishCoverage(adapters: [coberturaAdapter('coverage.xml')], sourceFileResolver: sourceFiles('NEVER_STORE'))
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