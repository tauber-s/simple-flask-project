pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://https://github.com/tauber-s/simple-flask-project.git'
      }
    }

    stage('Build') {
      steps {
        sh 'docker-compose -f docker-compose.yml build'
      }
    }

    stage('Test') {
      steps {
        sh 'docker-compose -f docker-compose.yml run --rm tests'
      }
    }
  }
}
