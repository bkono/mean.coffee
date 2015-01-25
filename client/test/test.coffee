describe "Controller: 'MainCtrl'", ->

  beforeEach module('meanApp')

  beforeEach inject ($rootScope, $controller) ->
    @scope = $rootScope.$new()
    $controller 'MainCtrl',
      $scope: @scope

  describe "'testArray'", ->
    fruits = ['apple', 'banana', 'cherry']

    it "should contain #{fruits.length} fruits", ->
      assert.equal @scope.testArray.length, fruits.length

    it "should be the same array as #{fruits}", ->
      assert.equal JSON.stringify(@scope.testArray), JSON.stringify(fruits)