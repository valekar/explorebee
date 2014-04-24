app.controller("RightHomeController",RightHomeController);
RightHomeController.$inject = ['$scope','SuggestionServices','UserServices','NewsLetterService'];


function RightHomeController($scope,SuggestionServices,UserServices,NewsLetterService){
    $scope.test = "Hello world";

    $scope.affinities = [];
    var local = [];
    SuggestionServices.getFriendSuggestions().success(function(data){
        //$scope.affinities.push(data);

        angular.forEach(data,function(v,k){
           //console.log(k);
            //console.log(v);
            //$scope.affinities.push(v);
            local.push(v);
        });


        var lo = local[0];

        for(var i=0;i<lo.length;i++){
            $scope.affinities.push(lo[i]);
        }

        //console.log($scope.affinities);
    });


    $scope.relate = function(user_id,affinity_id,index){
       var other_id = {
           //if i use id then then post will change
           other_id:user_id,
           affinity_id:affinity_id
       };
      var result = UserServices.setRelation().save(other_id);

      $scope.affinities.splice(index,1);

    }


    $scope.sendNewsletter = function(){
        NewsLetterService.sendNewsLetter().success(function(data){
           alert(data);
        });
    }



}