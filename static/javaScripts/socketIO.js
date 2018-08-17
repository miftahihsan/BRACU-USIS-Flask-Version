// firs of all initialize the module
var app = angular.module("app", []);

// then recognize all the container variables
app.controller("control-div-class-room", function($scope){

    // connected to the socket
    socket = io.connect("http://127.0.0.1:5000");

    // When the teacher presses the online/offline button
     // This function will get called


    $scope.teacherLogOut = function(){

      if($scope.user_identity == "Teacher"){
        socket.emit('teacherLogOutRequest', 0, $scope.teacher_loged_in_id);
      }

    }

    $scope.teacherOnclick = function(){

        var availability = 0;

        if($scope.checked){

            availability = 1;

        }

        socket.emit('availabilityRequest', availability, $scope.teacher_loged_in_id);

    }


    // Here we perform the check for teacher availability
    socket.on('ShowAvailability', function(results){

      // used to change teacher availability indicator
      var availability = results.availability;
      var teacherID = results.teacherID;
      var teacherAvailabilityId = "teacher_profile_pic_" + teacherID + "";

      // used to chnage the text of availabilityRequest
      var availabilityText = "availability-text-"+teacherID+"";
      myTextElement = angular.element(document.querySelector("#"+availabilityText+""));



      if(availability == 0){

        $("#"+teacherAvailabilityId+"").css('background-color', 'red');
        myTextElement.text('Not available');

      }else{

        $("#"+teacherAvailabilityId+"").css('background-color', '#64ff56');
        myTextElement.text('Available');

      }


    });

});
