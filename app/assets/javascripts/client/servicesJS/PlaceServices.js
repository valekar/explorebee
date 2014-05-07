app.factory("PlaceServices",PlaceServices);
PlaceServices.$inject = ['$http'];

function PlaceServices($http){
    var loader = angular.element("#loadeer");

    var service = {

//        var url = "/places/get_other_places"
//        return $http.get(url);
          getPlacesUrl :function(interest_id){
              return $http.get("/places/signed_index?interest_id="+interest_id);
          },

          getPaginationUrl:function(offset){
              return $http.get("/places/signed_index?page="+offset);
          },
          getNextPage:function(counter){

                   loader.show();
                return $http.get("/places/getPlaces?page="+counter);
          },
            getNextInterest:function(id){
                loader.show();
                return $http.get("/places/getPlaces?interest_id="+id);
            }


        };

        return service;

}
app.factory("PlaceFavouriteService",PlaceFavouriteService);
PlaceFavouriteService.$inject = ['$http'];

function PlaceFavouriteService($http){

        var service = {
        getPlaceUrl:function(id){
            return $http.get("/places/favourite?place="+id);
            }
        };

        return service;

}/*.factory("PlaceAndTripServices",function($resource){
       var service ={
           getPlaceAndTripUrl:function(){
               return $resource("/trips/create_trip/:id.json",{id:"@id"});
           }
       }

        return service;

    });*/

//Newly added after getting al services into one file
app.factory("PlaceDetailServices",PlaceDetailServices);
PlaceDetailServices.$inject = ['$http'];
function PlaceDetailServices($http){
    var loader = angular.element("#loadeer");
    var service ={
        getDetailDescription:function(trackable_id){
            loader.show();
            return $http.get("/places/getDetailDescription?place_id="+trackable_id);
        }
    };
    return service;
}


//Used in unsigned html page /static_pages/home part
app.factory("UnsignedPlaceServices",UnsignedPlaceServices);
UnsignedPlaceServices.$inject=["$http"];

function UnsignedPlaceServices($http){
    return {
        getRecentPlaces:function(){
            return $http.get("/static_pages/get_place_photos");
        }
    }
}



app.factory("PlacePhotoDeleteService",PlacePhotoDeleteService);
PlacePhotoDeleteService.$inject = ["$resource"];

function PlacePhotoDeleteService($resource){
    return {
        getDeletePhoto: function(){
            //return $resource("/trips/acceptance:id.json",{id:"@id"});
            return $resource("/places/deletePhotos");
        }
    }


}

