This is a demo of CloudFoundry Service API v2.

http://docs.cloudfoundry.com/docs/running/architecture/services/writing-service.html

Steps to install this demo:
1. push "echoservice" into CF

2. push "echoservice-broker" into CF
   Before you push the broker, please modify the echo service url in echo_service_broker.rb
   
3. add the service broker to CF:
   cf add-service-broker JimmyEchoService --username someuser --password somethingsecure --url http://jimmyechoservice-broker.ng.bluemix.net/
   
4. push "echoservice-demo" into CF, and create and bind Echo Service to it.

