// Used in post edit.html.erb

app.controller("PostEditCtrl",PostEditCtrl);
PostEditCtrl.$inject = ['$scope','PostCleanMemoryService'];

function PostEditCtrl($scope,PostCleanMemoryService){
    $scope.cleanPostMemory = function(id){

        var DetailDescContent = (tinyMCE.get('post_detail_desc').getContent());
        var DescContent = tinyMCE.get('post_desc').getContent();


        var content = DetailDescContent.concat(DescContent);

        // var $content = $(content);

        var div = document.createElement('div');
        div.innerHTML = content;
        //alert(div.getElementsByTagName('img')[0].src);
        //console.log(div.getElementsByTagName('img')[0].src);

        var photos = [];

        for(var i=0;i<div.getElementsByTagName('img').length;i++){
            photos.push(div.getElementsByTagName('img')[i].src);
        }

        console.log(photos);

        var container = {
            post_id:id,
            photo_urls:photos
        };

        var Clean = PostCleanMemoryService.getCleanPhoto();

        var result =  Clean.save(container);

        if(result){
            alert("success")
        }


    }
}