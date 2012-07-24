
// First argument must be app Name
angular.module('BookApp', ['ngResource']).factory('Books', function ($resource) {
  return $resource('/api/books')
});
