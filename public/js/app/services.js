var AppFake = angular.module('AppFake', ['App', 'ngMockE2E']);
   AppFake.run(function($httpBackend) {
     $httpBackend.whenGET(/templates\/.*/).passThrough();
     $httpBackend.whenGET(/something/).respond([{"key":"value"}]);
     
     $httpBackend.whenPOST(/\/kbEntry/).passThrough();
   });
