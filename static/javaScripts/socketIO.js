// firs of all initialize the module
var app = angular.module("app", []);

// then recognize all the container variables
app.controller("control-div-class-room", function($scope){

      // connected to the socket
      socket = io.connect("http://127.0.0.1:5000");


      // This is when the user posts something
      $scope.onPostSubmit = function(){


        var post_text = CKEDITOR.instances.composePostModalInput.getData();


        if(post_text == ""){
          return;
        }

        // alert(post_text);

        socket.emit("boradCastPost", $scope.class_room_id, $scope.user_identity, $scope.user_ID, post_text);
        CKEDITOR.instances.composePostModalInput.setData('');
        $("#composePostButton").modal('hide');
        // alert("made it")
        // $scope.emit("boradCastPost", post_text, $scope.user_ID, $scope.user_identity);

      }


      // When the teacher presses the online/offline button
      // This function will get called
      $scope.teacherLogOut = function(){

        if($scope.user_identity == "Teacher"){
          socket.emit('teacherLogOutRequest', 0, $scope.user_ID);
        }

      }

      $scope.teacherOnclick = function(){

          var availability = 0;

          if($scope.checked){

              availability = 1;

          }

          socket.emit('availabilityRequest', availability, $scope.user_ID);

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
