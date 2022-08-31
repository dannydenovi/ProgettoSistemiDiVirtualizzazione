JUPYTER_HOST=`kubectl get ingress | grep tensorflow-jupyter-rpi | tr -s ' ' | cut -d ' ' -f 4`
JUPYTER_TOKEN=`kubectl logs deployment.apps/tensorflow-jupyter-rpi | grep "http://127.0.0.1:8888/?token" | tail -1 | sed -e 's/.*?token=//g'`
echo "navigating to http://$JUPYTER_HOST/?token=$JUPYTER_TOKEN"
