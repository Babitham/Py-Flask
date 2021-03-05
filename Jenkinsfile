node {
        checkout scm
        stage('Authenticate'){
        bat '''
        ibmcloud --version
        ibmcloud login --apikey "X4YucS-zDUxFPMlsiP1pftXGc2E_E_4NDq4Hj-iyRNnG" -r us-south -g Default
        ibmcloud plugin install -f container-service
        ibmcloud plugin install -f container-registry
        ibmcloud plugin install -f observe-service
        ibmcloud plugin list
        ibmcloud ks cluster config --cluster c0sf25ud0fesivtjm07g
        
         '''
  }

     stage('Docker-push'){

    docker.withRegistry('https://registry.hub.docker.com', 'D') {

        def customImage = docker.build("babitham/k8-kubernets")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
 
  
  stage('Kubernets pod'){
    bat "ibmcloud ks cluster config --cluster c0sf25ud0fesivtjm07g"
    bat "kubectl config current-context"
    bat 'kubectl apply -f service.yaml'
    bat 'kubectl apply -f deployment.yaml'
    bat 'kubectl get pods'
  }
}
