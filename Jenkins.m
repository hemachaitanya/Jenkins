pipeline {
    agent{label('RRR')}
    stages{
        stage ('vcs'){
            steps{
                git url : "https://github.com/hemachaitanya/terraformslack.git",
                    branch: "dev"
            }
        }
        stage ('terraform'){
            steps{
                sh 'terraform init'
                sh 'terraform validate'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}