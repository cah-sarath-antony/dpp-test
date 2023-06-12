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
      stage ('Use dir') {
        agent any
        steps {
            script {
              dir('my-scheduling/terraform/eks-cluster') {
                sh 'ls'
              }
            }
        }
      }

      // stage('Terraform Init') {
      //     steps {
      //       sh 'terraform init --backend-config=backends/dev.hcl'
      //     }
      // }

      // stage('Terraform plan'){
      //     steps{
      //       sh 'terraform plan -out=tfplan -var-file="env/dev.tfvars.json" -auto-approve=false'
      //     }
      // }

      // stage('Terraform apply'){
      //     steps{
      //       sh "terraform apply -auto-approve=true tfplan"
      //     }
      // }
    }
}
