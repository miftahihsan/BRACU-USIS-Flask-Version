// firs of all initialize the module
var app = angular.module("app", []);

// then recognize all the container variables
app.controller("control-div-class-room", function($scope){

    // creating the online offline id to show realtime
    // var x = $scope.name;

    // var teacherAvailabilityId = "teacher_profile_pic_" + x;

    // $scope.W = "hello";
    // This is where I will connect with the server and set everything up

    // connected to the socket
    socket = io.connect("http://127.0.0.1:5000");



    // When the teacher presses the online/offline button
     // This function will get called
    $scope.onclick = function(){

      var availability = 0;
      if($scope.checked){
        availability = 1;
      }

      // alert($scope.teacher_id);
      // alert($scope.teacher_banner_id);


      socket.emit('availabilityRequest', availability, $scope.teacher_id);

    }


    // Here we perform the check for teacher availability
    socket.on('ShowAvailability', function(results){

      var availability = results.availability;

      var teacherID = results.teacherID;

      var teacherAvailabilityId = "teacher_profile_pic_" + teacherID + "";

      // alert(document.getElementsByClassName('off-line')[0].id);

      // alert(teacherAvailabilityId);

      // var availabilityIconJquery = document.getElementById("teacherAvailabilityId");

      // angular.element(availabilityIconJquery);


      if(availability == 0){
        document.getElementById("teacherAvailabilityId").classList.add('off-line');
      }else{
        // alert(teacherAvailabilityId);
        document.getElementById("teacherAvailabilityId").classList.add('online');
      }

    });




});
