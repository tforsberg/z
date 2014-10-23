'use strict';

var app = angular.module('app');

// tree controller: show how to use the grid as a tree 
app.controller('treeCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        persons: [ getPerson() ],
        flexUnbound: null,
        flexBound: null
    };

    // populate the unbound grid when it is created
    $scope.$watch('ctx.flexUnbound', function () {
        var flex = $scope.ctx.flexUnbound;
        if (flex) {
            showPersonOnGrid(flex, getPerson());
        }
    });

    // create tree data
    function getPerson() {

        // number of children for each person (4 levels)
        // item count is 1 + count + count^2 + count^3 + count^4
        // (e.g. count = 10 => ~10,000 people)
        var count = 10;

        // build person tree
        var person = new Person(1, 1);
        for (var i = 0; i < count; i++) {
            var pi = new Person(2, i + 1);
            person.children.push(pi);
            for (var j = 0; j < count; j++) {
                var pj = new Person(3, j + 1);
                pi.children.push(pj);
                for (var k = 0; k < count; k++) {
                    var pk = new Person(4, k + 1);
                    pj.children.push(pk);
                    for (var l = 0; l < count; l++) {
                        var pl = new Person(5, l + 1);
                        pk.children.push(pl);
                    }
                }
            }
        }
        return person;
    }

    // Person: hierarchical data object with id, name, children (an array of Person objects)
    function Person(level, id) {
        this.id = level * 1000 + id;
        this.name = 'Person ' + level + '.' + id;
        this.level = level;
        this.children = [];
        Object.defineProperty(this, 'childCount', {
            enumerable: true,
            get: function () { return this.children.length; }
        });
        Object.defineProperty(this, 'descendantCount', {
            enumerable: true,
            get: function () {
                var cnt = 0;
                for (var i = 0; i < this.children.length; i++) {
                    cnt += this.children[i].descendantCount + 1;
                }
                return cnt;
            }
        });
    }

    // populate unbound FlexGrid
    function showPersonOnGrid(flex, p) {

        // initialize grid
        flex.rows.clear();
        flex.columns.clear();

        // add columns we want to show
        var c = new wijmo.grid.Column();
        c.header = 'Name';
        c.binding = 'name';
        c.width = '*';
        c.minWidth = 120;
        c.allowDragging = false;
        flex.columns.push(c);

        c = new wijmo.grid.Column();
        c.header = 'Level';
        c.binding = 'level';
        c.align = 'right';
        flex.columns.push(c);

        c = new wijmo.grid.Column();
        c.header = 'Children';
        c.binding = 'childCount';
        c.align = 'right';
        flex.columns.push(c);

        c = new wijmo.grid.Column();
        c.header = 'Descendants';
        c.binding = 'descendantCount';
        c.align = 'right';

        flex.columns.push(c);

        flex.deferUpdate(function() {
            addPersonToGrid(flex, p, 0);
            flex.autoSizeColumn(0);
        });
    }
    function addPersonToGrid(flex, p, level) {

        // create a row for this person
        var gr = new wijmo.grid.GroupRow();
        gr.level = level;
        gr.dataItem = p;

        // add this person to the grid
        flex.rows.push(gr);

        // and add any children
        for (var i = 0; i < p.children.length; i++) {
            addPersonToGrid(flex, p.children[i], level + 1);
        }
    }
});
