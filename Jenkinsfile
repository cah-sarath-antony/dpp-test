pipeline {
    agent {
    kubernetes {
      yaml """
        apiVersion: v1
        kind: Pod
        metadata:
          labels:
            name: dpp-mx-jenkins-agent
        spec:
          containers:
          - name: dpp-mx-jenkins-agent
            image: 998585994771.dkr.ecr.us-east-1.amazonaws.com/dpp-mx-jenkins-agent:latest
            command:
            - cat
            tty: true
            volumeMounts:
              - name: dockersock
                mountPath: "/var/run/docker.sock"
          volumes:
            - name: dockersock
              hostPath:
                path: /var/run/docker.sock
      """
    }
  }
    stages {
        stage('Test') {
            steps {
                container('dpp-mx-jenkins-agent') {
                sh """
                    terraform --version
                    aws --version
                    helm version
                    kubectl version
                """
                }
            }
        }
    }
}
