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
		try{   
		    steps {
		    	sh 'docker rm -f helloworld'	    	
		    }	  
		 }catch(error){

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


	try{
        def sshCmd = 'ssh -o StrictHostKeyChecking=no ec2-user@172.31.18.198'
        def dockerRM = 'docker rm -f my-app'
        sh "${sshCmd} ${dockerRM}"
      }catch(error){

      }


