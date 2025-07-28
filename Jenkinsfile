pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "flask-app"
    HELM_CHART_PATH = "helm/"
    RELEASE_NAME = "flask-app"
    NAMESPACE = "default"
  }

  stages {
    stage('Clone Git Repo') {
      steps {
        checkout scm
      }
    }

    stage('Run Tests') {
      steps {
        sh 'pip3 install -r requirements.txt'
        sh 'pytest'
      }
    }

    stage('Build Image') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE .'
      }
    }

    stage('Load to Minikube') {
      steps {
        sh 'eval $(minikube docker-env) && docker build -t $DOCKER_IMAGE .'
      }
    }

    stage('Deploy') {
      steps {
        sh '''
        helm upgrade --install $RELEASE_NAME $HELM_CHART_PATH \
          --namespace $NAMESPACE \
          --set image.repository=$DOCKER_IMAGE \
          --set image.tag=latest
        '''
      }
    }
  }
}
