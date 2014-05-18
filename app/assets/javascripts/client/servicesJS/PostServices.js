app.factory("PostCleanMemoryService",PostCleanMemoryService);
PostCleanMemoryService.$inject = ['$resource'];


function PostCleanMemoryService($resource){
    return {
        getCleanPhoto:function(){
            return $resource("/posts/cleanMemory")
        }
    }
}