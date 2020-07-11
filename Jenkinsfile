pipeline {
  agent any
  stages {
    stage('Flutter Doctor') {
      steps {
        bat 'flutter doctor'
      }
    }

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
        bat 'flutter build apk --%BUILD_TYPE%'
        archiveArtifacts '**/*.apk'
      }
    }

  }
  parameters {
    choice(name: 'BUILD_TYPE', choices: ['debug', 'release'], description: 'Build Type for APK')
  }
}
