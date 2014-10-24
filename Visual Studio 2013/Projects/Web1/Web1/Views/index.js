
app
    .controller('Controller', ['$scope', function ($scope) {
    $scope.customer = {
        name: 'Naomi',
        address: '1600 Amphitheatre'
    };
}])
    .directive('myCustomer', function () {
      return {
          template: 'Name: {{customer.name}} Address: {{customer.address}}'
      };
  });

app.controller('AlertDemoCtrl', ['$scope', function ($scope) {
    $scope.alerts = [
      { type: 'danger', msg: 'Oh snap! Change a few things up and try submitting again.' },
      { type: 'success', msg: 'Well done! You successfully read this important alert message.' }
    ];

    $scope.addAlert = function () {
        $scope.alerts.push({ msg: 'Another alert!' });
    };

    $scope.closeAlert = function (index) {
        $scope.alerts.splice(index, 1);
    };

}]);
