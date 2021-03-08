node {
        checkout scm
        stage('Authenticate'){
        bat '''
        ibmcloud --version
        ibmcloud login --apikey "NDHdSwRG4hMOLfJGi7-UPWa9qEfbUNVokZNPc5Iyrejb" -r us-south -g Default
        ibmcloud plugin install -f container-service
        ibmcloud plugin install -f container-registry
        ibmcloud plugin install -f observe-service
        ibmcloud plugin list
        ibmcloud ks cluster config --cluster c0sf25ud0fesivtjm07g
        
         '''
  }

  stage('Kubernets pod'){
    bat "ibmcloud ks cluster config --cluster c0sf25ud0fesivtjm07g"
    bat "kubectl config current-context"
    bat 'kubectl apply -f service.yaml'
    bat 'kubectl apply -f deployment.yaml'
    bat 'kubectl apply -f ingress.yml'
    bat 'kubectl get pods'
  }
}
