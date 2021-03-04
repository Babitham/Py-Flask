node {
        checkout scm

stage('Docker-push'){

    docker.withRegistry('https://registry.hub.docker.com', 'D') {

        def customImage = docker.build("babitham/k8-kubernets")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
        stage('Install IBM Cloud CLI') {
      steps { 
        bat ''' 
            curl -fsSL https://clis.cloud.ibm.com/install/linux | bat
            ibmcloud --version
            ibmcloud config --check-version=false
            ibmcloud plugin install -f kubernetes-service
            ibmcloud plugin install -f container-registry
            '''
      }
   }
 stage('Authenticate'){
  bat ''' ibmcloud login -–apikey cLfnx1PA_iUVFaV5Q1NcE5s9Cw7WbGBbagMjtGQGgff0 -r us-south -g Default
        ibmcloud plugin install -f container-service
        ibmcloud plugin install -f container-registry
        ibmcloud plugin install -f observe-service
        ibmcloud plugin list
        ibmcloud ks  cluster config -cluster c0sf25ud0fesivtjm07g
         '''
  }
  
  stage('Kubernets pod'){
    bat "ibmcloud ks  cluster config -cluster c0sf25ud0fesivtjm07g"
    bat "kubectl config current-context"
    bat 'kubectl apply -f servicepy.yaml'
    bat 'kubectl apply -f flask-deployment.yaml'
    bat 'kubectl get pods'
  }
}
