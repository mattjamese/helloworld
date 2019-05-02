pipeline {
  agent any
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Remove Old Containers'){	 
		agent any     
	    steps {
	    	    script {
					  try {
					      sh 'docker rm -f helloworld'	
					  } catch (Exception e) {
					      sh 'No container exception!'
					  }
					}	
				}	     
	}
	
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t helloworld:latest .'
      }
    }
  
	stage('Deploy-Dev'){	
		agent any     
	    steps { 
	      	sh 'docker run -d -p 8091:8091 --name helloworld helloworld'
	    }	 
	}   
    
  }
}



