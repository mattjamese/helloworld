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
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t helloworld:latest .'
      }
    }
    
	stage('Remove Old Containers'){   
	  try{       
	    def dockerRM = 'docker rm -f helloworld'
	    sh "${dockerRM}"
	  }catch(error){
	  }      
	}
  
	stage('Deploy-Dev'){	 
	      input 'Deploy  to Dev?'
	      def dockerRun = 'docker run -d -p 8091:8091 --name helloworld helloworld'
	      sh "${dockerRun}"	 
	}   
    
  }
}