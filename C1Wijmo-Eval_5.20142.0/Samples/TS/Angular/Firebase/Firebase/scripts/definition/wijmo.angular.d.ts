/*
    *
    * Wijmo Library 5.20142.6
    * http://wijmo.com/
    *
    * Copyright(c) GrapeCity, Inc.  All rights reserved.
    * 
    * Licensed under the Wijmo Commercial License. 
    * sales@wijmo.com
    * http://wijmo.com/widgets/license/
    *
    */
declare module wijmo.angular {
    class WjDirective implements ng.IDirective {
        static _parPropAttr: string;
        static _cntrlScopeProp: string;
        static _scopeChildrenProp: string;
        static _optionalAttr: boolean;
        static _angStripPrefixes: string[];
        public link: (scope: ng.IScope, templateElement: ng.IAugmentedJQuery, templateAttributes: ng.IAttributes, controller: any, transclude: ng.ITranscludeFunction) => any;
        public controller: any;
        public replace: boolean;
        public require: any;
        public restrict: string;
        public scope: any;
        public template: string;
        public transclude: boolean;
        public _property: string;
        public _isPropertyArray: boolean;
        public _ownObject: boolean;
        public _props: PropDesc[];
        public _events: EventDesc[];
        public _controlConstructor : any;
        constructor();
        private _initDirective();
        public _initProps(): void;
        public _initEvents(): void;
        public _createLink(): WjLink;
        public _controllerImpl(controller: any, scope: any): void;
        public _isChild(): boolean;
        private _initScopeEvents();
        private _initScopeDescription();
        public _postLinkFn(): (scope: any, tElement: ng.IAugmentedJQuery, tAttrs: ng.IAttributes, controller?: any) => void;
        static _versionOk(minVer: string): boolean;
    }
    class WjLink {
        public directive: WjDirective;
        public scope: ng.IScope;
        public tElement: ng.IAugmentedJQuery;
        public tAttrs: ng.IAttributes;
        public controller: any;
        public directiveTemplateElement: JQuery;
        public control: any;
        public parent: WjLink;
        constructor();
        public _link(): void;
        public _onChildrenReady(): void;
        private _createInstance();
        private _parentReady(parentLink);
        public _initParent(): void;
        private _notifyReady();
        public _initControl(): any;
        private _prepareControl();
        private _setupScopeWithControlProperties();
        private _addWatchers();
        private _addWatcher(prop);
        private _addEventHandlers();
        private _addEventHandler(eventDesc);
        private _castValueToType(value, prop);
        private _parseDate(value);
        private _getParentProp();
        private _isChild();
        private _useParentObj();
        public _safeApply(scope: any, name: any, value: any): void;
        public _shouldApply(scope: any, name: any, value: any): boolean;
        public _canApply(scope: any, name: any): boolean;
    }
    class PropDesc {
        private _propertyName;
        private _propertyType;
        private _scopeBindingMode;
        private _enumType;
        private _isNativeControlProperty;
        private _customHandler;
        constructor(propertyName: string, propertyType: PropertyType, scopeBindingMode: string, enumType?: any, customHandler?: (scope: ng.IScope, control: Control, value: any, oldValue: any, link: WjLink) => void, isNativeControlProperty?: boolean);
        public propertyName : string;
        public propertyType : PropertyType;
        public scopeBindingMode : string;
        public enumType : any;
        public customHandler : (scope: ng.IScope, control: Control, value: any, oldValue: any, link: WjLink) => void;
        public isNativeControlProperty : boolean;
    }
    class EventDesc {
        private _eventName;
        private _isPropChanged;
        constructor(eventName: string, isPropChanged?: boolean);
        public eventName : string;
        public isPropChanged : boolean;
    }
    enum PropertyType {
        Boolean = 0,
        Number = 1,
        Date = 2,
        String = 3,
        Enum = 4,
        Function = 5,
        EventHandler = 6,
        Any = 7,
    }
}

declare module wijmo.angular {
}

declare module wijmo.angular {
    class WjMenuLink extends WjLink {
        public _link(): void;
    }
}

declare module wijmo.angular {
}

declare module wijmo.angular {
}

/**
* Contains AngularJS directives for the Wijmo controls.
*
* The directives allow you to add Wijmo controls to
* <a href="https://angularjs.org/">AngularJS</a>
* applications using simple markup in HTML pages.
*
* Directives can be used as regular HTML tags on the page markup. The
* tag name corresponds to the control name, prefixed by "wj-", and the
* attributes correspond to the names of control properties and events.
*
* All control, property, and event names within directives should follow
* the usual AngularJS convention of replacing camel-case with hyphenated
* lower-case names.
*
* AngularJS directive parameters come in thee flavors, depending on the
* type of binding they use. The table below describes each one:
*
* <dl class="dl-horizontal">
*   <dt><code>@</code></dt>   <dd>By-value, or one-way binding. The attribute value is interpreted as a literal.</dd>
*   <dt><code>=</code></dt>   <dd>By-reference, or two-way binding. The attribute value is interpreted as an expression.</dd>
*   <dt><code>&</code></dt>   <dd>Function binding. The attribute value is interpreted as a function call, including the parameters.</dd>
* </dl>
*
* For more details on the different binding types, please see
* <a href="http://weblogs.asp.net/dwahlin/creating-custom-angularjs-directives-part-2-isolate-scope">
*   Dan Wahlin's blog on directives
* </a>.
*
* The documentation does not describe the directive events because they are identical to
* the control events, and the binding mode is always the same (function binding).
*
* To illustrate, here is the markup used to create a @see:ComboBox control:
*
* <pre>&lt;wj-combo-box
*   text="ctx.theCountry"
*   items-source="ctx.countries"
*   is-editable="true"
*   selected-index-changed="ctx.selChanged(s, e)"&gt;
*   &lt;/wj-combo-box&gt;</pre>
*
* Notice that the <b>text</b> property of the @see:ComboBox is bound to a controller
* variable called "ctx.theCountry". The binding is two-way; changes in the control
* udpate the scope, and changes in the scope update the control. If we wanted to
* initialize the <b>text</b> property with a string constant, we would have to enclose
* the attribute value in single quotes (for example, <code>text="'constant'"</code>).
*
* Notice also that the <b>selectedIndexChanged</b> event is bound to a controller
* method called "selChanged", and that the binding includes the two event parameters
* (without the parameters, the method won't be called).
* Whenever the control raises the event, the directive invokes the controller method.
*/
declare module wijmo.angular {
}

