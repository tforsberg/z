/// <reference path='../typings/firebase/firebase.d.ts' />
/// <reference path='../typings/firebase/firebase-simplelogin.d.ts' />
module wijmo.data {

    /**
     * Extends @see:CollectionView to support Firebase databases.
     *
     * Firebase is a powerful API to store and sync data in real time.
     *
     * The @see:FirebaseCollectionView class extends @see:CollectionView
     * to connect to Firebase tables. The class loads data from Firebase 
     * tables (lists) and allows users to edit, add, and remove items. When 
     * the data  changes, the Firebase tables are automatically updated.
     */   
    export class FirebaseCollectionView extends wijmo.collections.CollectionView {
        _url: string;
        _fb: Firebase;
        _items: wijmo.collections.ObservableArray;

        /**
         * Initializes a new instance of a @see:FirebaseCollectionView.
         *
         * @param url Url of the Firebase table (e.g. 'https://Firebase.firebaseIO-demo.com/Northwind/products')
         * @param notify Function called when the table is loaded (optional).
         */
        constructor(url: string, dataTypes?: any[], notify?: Function) {

            // create CollectionView
            this._items = new wijmo.collections.ObservableArray();
            super(this._items);

            // create Firebase
            this._url = url;
            this._fb = new Firebase(url);

            // populate collection
            var self = this;
            self._fb.once('value', function (data) {

                // got the data, populate list
                self.beginUpdate();
                self._items.clear();
                data = data.val();
                var lastKey = '0';
                for (var key in data) {
                    var item = self._createLocalItem(key, data[key], dataTypes);
                    self._items.push(item);
                    lastKey = key;
                }
                self.endUpdate();
                self.moveCurrentToFirst();

                // done populating, invoke callback to notify listeners
                if (notify) {
                    notify();
                }

                // and start listening to changes:
                // 1) Items added (but not the ones that were already loaded)
                //self._fb.on('child_added', function (data) {
                self._fb.startAt(null, lastKey).on("child_added", function (data) {
                    var item = data.val(),
                        key = data.name();
                    if (key != lastKey) {
                        var index = self._indexOf(key);
                        if (index > -1) {
                            console.log('adding an item that is already on the list?');
                        } else {
                            item = self._createLocalItem(key, item, dataTypes);
                            self._items.push(item);
                            if (notify) {
                                notify();
                            }
                        }
                    }
                });

                // 2) Items removed
                self._fb.on('child_removed', function (data) {
                    var item = data.val(),
                        key = data.name(),
                        index = self._indexOf(key);
                    if (index < 0) {
                        console.log('removing an item that is not on the list?');
                    } else {
                        self._items.removeAt(index);
                        if (notify) {
                            notify();
                        }
                    }
                });

                // 3) Items changed
                self._fb.on('child_changed', function (data) {
                    var item = data.val(),
                        key = data.name(),
                        index = self._indexOf(key);
                    if (index < 0) {
                        console.log('changing an item that is not on the list?');
                    } else if (!self._sameItem(item, self._items[index])) {
                        self._items.splice(index, 1, item);
                        if (notify) {
                            notify();
                        }
                    }
                });
            });
        }
        /**
         * Overridden to commit edits to Firebase.
         */
        commitEdit() {
            var item = this.currentEditItem;
            if (item != null && item._key && !this._sameItem(item, this._edtClone)) {
                var fb = this._fb.child(item._key);
                item = this._createFbItem(item);
                fb.set(item);
            }
            super.commitEdit();
        }
        /**
         * Overridden to add new items to Firebase.
         */
        commitNew() {
            var item = this.currentAddItem;
            if (item != null) {
                item = this._createFbItem(item);
                this._fb.push(item);
                super.cancelNew(); // add when fb reports back
            } else {
                super.commitNew();
            }
        }
        /**
         * Overridden to remove items from Firebase.
         */
        remove(item: any) {
            if (item != null && item._key) {
                this._fb.child(item._key).remove();
            }
        }

        // implementation

        // finds an object by Firebase key
        _indexOf(key: string): number {
            for (var i = 0; i < this._items.length; i++) {
                if (this._items[i]._key == key) {
                    return i;
                }
            }
            return -1;
        }

        // compare two items
        _sameItem(o1: any, o2: any): boolean {
            for (var key in o1) {
                if (o1[key] != o2[key]) {
                    return false;
                }
            }
            return true;
        }

        // create Firebase item by removing the Firebase key added for local use
        // and converting dates into strings
        _createFbItem(item: any): any {
            var fbItem = {};
            for (var key in item) {
                if (key != '_key') {
                    var value = item[key];
                    if (wijmo.isDate(value)) {
                        value = value.toString();
                    }
                    fbItem[key] = value;
                }
            }
            return fbItem;
        }

        // create local item with Firebase key and proper types
        _createLocalItem(key: string, item: any, dataTypes: any[]) {
            var localItem = { _key: key };
            for (var k in item) {
                localItem[k] = item[k];
                if (dataTypes) {
                    for (var i = 0; i < dataTypes.length; i++) {
                        var name = dataTypes[i].name,
                            type = dataTypes[i].type;
                        if ((isString(name) && name == k) ||
                            (tryCast(name, RegExp) && name.test(k))) {
                            localItem[k] = wijmo.changeType(localItem[k], type, null);
                            break;
                        }
                    }
                }
            }
            return localItem;
        }
    }
} 