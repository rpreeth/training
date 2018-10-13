pipeline {
	agent { docker { image 'maven' } }

	environment {
        	DOCKER_PATH = '/bin'
		M2_HOME = '/usr/share/maven'
		PATH = "${PATH}:${DOCKER_PATH}:${M2_HOME}/bin"
    	}

	stages {
		stage ('Checkout') {
			steps {
				git 'https://github.com/tektutor/maven-hello-project.git'
			}
		}
		stage ('Build') {
			steps {
				sh 'mvn clean package'
				junit '**/target/surefire-reports/TEST-*.xml'
				archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
			}
		}
	}
}
