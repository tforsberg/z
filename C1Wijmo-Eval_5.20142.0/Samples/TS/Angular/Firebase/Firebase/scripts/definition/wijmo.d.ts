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
/**
* Contains utilities used by all controls and modules, as well as the
* @see:Control and @see:Event classes.
*/
declare module wijmo {
    /**
    * Gets the version of the Wijmo library that is currently loaded.
    */
    function getVersion(): string;
    /**
    * Enumeration with key values.
    *
    * This enumeration is useful when handling <b>keyDown</b> events.
    */
    enum Key {
        /** The backspace key. */
        Back = 8,
        /** The tab key. */
        Tab = 9,
        /** The enter key. */
        Enter = 13,
        /** The escape key. */
        Escape = 27,
        /** The space key. */
        Space = 32,
        /** The page up key. */
        PageUp = 33,
        /** The page down key. */
        PageDown = 34,
        /** The end key. */
        End = 35,
        /** The home key. */
        Home = 36,
        /** The left arrow key. */
        Left = 37,
        /** The up arrow key. */
        Up = 38,
        /** The right arrow key. */
        Right = 39,
        /** The down arrow key. */
        Down = 40,
        /** The delete key. */
        Delete = 46,
        /** The F1 key. */
        F1 = 112,
        /** The F2 key. */
        F2 = 113,
        /** The F3 key. */
        F3 = 114,
        /** The F4 key. */
        F4 = 115,
        /** The F5 key. */
        F5 = 116,
        /** The F6 key. */
        F6 = 117,
        /** The F7 key. */
        F7 = 118,
        /** The F8 key. */
        F8 = 119,
        /** The F9 key. */
        F9 = 120,
        /** The F10 key. */
        F10 = 121,
        /** The F11 key. */
        F11 = 122,
        /** The F12 key. */
        F12 = 123,
    }
    /**
    * Enumeration with value types.
    *
    * Use the @see:getType method to get a @see:DataType from a value.
    */
    enum DataType {
        /** Object (anything). */
        Object = 0,
        /** String. */
        String = 1,
        /** Number. */
        Number = 2,
        /** Boolean. */
        Boolean = 3,
        /** Date (date and time). */
        Date = 4,
        /** Array. */
        Array = 5,
    }
    /**
    * Allows callers to verify whether an object implements an interface.
    */
    interface IQueryInterface {
        /**
        * Returns true if the object implements a given interface.
        *
        * @param interfaceName Name of the interface to look for.
        * @return True if the object implements the interface.
        */
        implementsInterface(interfaceName: string): boolean;
    }
    /**
    * Casts a value to a type if possible.
    *
    * @param value Value to cast.
    * @param type Type or interface name to cast to.
    * @return The value passed in if the cast was successful, null otherwise.
    */
    function tryCast(value: any, type: any): any;
    /**
    * Determines whether an object is a primitive type.
    *
    * @param value Value to test.
    * @return Whether the value is a primitive type (string, number, boolean, or date).
    */
    function isPrimitive(value: any): boolean;
    /**
    * Determines whether an object is a string.
    *
    * @param value Value to test.
    * @return Whether the value is a string.
    */
    function isString(value: any): boolean;
    /**
    * Determines is string null, empty or whitespace only.
    *
    * @param value Value to test.
    * @return Whether the value is null, empty or whitespace.
    */
    function isNullOrWhiteSpace(value: string): boolean;
    /**
    * Determines whether an object is a number.
    *
    * @param value Value to test.
    * @return Whether the value is a number.
    */
    function isNumber(value: any): boolean;
    /**
    * Determines whether an object is an integer.
    *
    * @param value Value to test.
    * @return Whether the value is an integer.
    */
    function isInt(value: any): boolean;
    /**
    * Determines whether an object is a Boolean.
    *
    * @param value Value to test.
    * @return Whether the value is a Boolean.
    */
    function isBoolean(value: any): boolean;
    /**
    * Determines whether an object is a function.
    *
    * @param value Value to test.
    * @return Whether the value is a function.
    */
    function isFunction(value: any): boolean;
    /**
    * Determines whether an object is undefined.
    *
    * @param value Value to test.
    * @return Whether the value is undefined.
    */
    function isUndefined(value: any): boolean;
    /**
    * Determines whether an object is a Date.
    *
    * @param value Value to test.
    * @return Whether the value is a Date.
    */
    function isDate(value: any): boolean;
    /**
    * Determines whether an object is an Array.
    *
    * @param value Value to test.
    * @return Whether the value is an Array.
    */
    function isArray(value: any): boolean;
    /**
    * Determines whether an object is an object (as opposed to a value type or a date).
    *
    * @param value Value to test.
    * @return Whether the value is an object.
    */
    function isObject(value: any): boolean;
    /**
    * Gets the type of a value.
    *
    * @param value Value to test.
    * @return A @see:DataType value representing the type of the value passed in.
    */
    function getType(value: any): DataType;
    /**
    * Changes the type of a value.
    *
    * If the conversion fails, the original value is returned. To check if a
    * conversion succeeded, you should check the type of the returned value.
    *
    * @param value Value to convert.
    * @param type @see:DataType to convert the value to.
    * @param format Format to use when converting to or from strings.
    * @return The converted value, or the original value if a conversion was not possible.
    */
    function changeType(value: any, type: DataType, format: string): any;
    /**
    * Replaces each format item in a specified string with the text equivalent of an
    * object's value.
    *
    * The function works by replacing parts of the <b>formatString</b> with the pattern
    * '{name:format}' with properties of the <b>data</b> parameter. For example:
    *
    * <pre>
    * var data = { name: 'Joe', amount: 123456 };
    * var msg = wijmo.format('Hello {name}, you won {amount:n2}!', data);
    * </pre>
    *
    * The optional <b>formatFunction</b> allows you to customize the content by providing
    * context-sensitive formatting. If provided, the format function gets called for each
    * format element and gets passed the data object, the parameter name, the format,
    * and the value; it should return an output string. For example:
    *
    * <pre>
    * var data = { name: 'Joe', amount: 123456 };
    * var msg = wijmo.format('Hello {name}, you won {amount:n2}!', data,
    *             function (data, name, fmt, val) {
    *               if (wijmo.isString(data[name])) {
    *                   val = wijmo.escapeHtml(data[name]);
    *               }
    *               return val;
    *             });
    * </pre>
    *
    * @param format A composite format string.
    * @param data The data object used to build the string.
    * @param formatFunction An optional function used to format items in context.
    * @return The formatted string.
    */
    function format(format: string, data: any, formatFunction?: Function): string;
    /**
    * Copies the properties from an object to another.
    *
    * The destination object must define all the properties defined in the source,
    * or an error will be thrown.
    *
    * @param dst The destination object.
    * @param src The source object.
    */
    function copy(dst: any, src: any): void;
    /**
    * Throws an exception if a condition is false.
    *
    * @param condition Condition expected to be true.
    * @param msg Message of the exception if the condition is not true.
    */
    function assert(condition: boolean, msg: string): void;
    /**
    * Checks that a value is a string.
    *
    * @param value Value supposed to be a string.
    * @param nullOK Whether null values are acceptable.
    * @return The string passed in.
    */
    function asString(value: string, nullOK?: boolean): string;
    /**
    * Checks that a value is a number.
    *
    * @param value Value supposed to be numeric.
    * @param nullOK Whether null values are acceptable.
    * @param positive Whether to accept only positive numeric values.
    * @return The number passed in.
    */
    function asNumber(value: number, nullOK?: boolean, positive?: boolean): number;
    /**
    * Checks that a value is an integer.
    *
    * @param value Value supposed to be an integer.
    * @param nullOK Whether null values are acceptable.
    * @param positive Whether to accept only positive integers.
    * @return The number passed in.
    */
    function asInt(value: number, nullOK?: boolean, positive?: boolean): number;
    /**
    * Checks that a value is a Boolean.
    *
    * @param value Value supposed to be Boolean.
    * @param nullOK Whether null values are acceptable.
    * @return The Boolean passed in.
    */
    function asBoolean(value: boolean, nullOK?: boolean): boolean;
    /**
    * Checks that a value is a Date.
    *
    * @param value Value supposed to be a Date.
    * @param nullOK Whether null values are acceptable.
    * @return The Date passed in.
    */
    function asDate(value: Date, nullOK?: boolean): Date;
    /**
    * Checks that a value is a function.
    *
    * @param value Value supposed to be a function.
    * @param nullOK Whether null values are acceptable.
    * @return The function passed in.
    */
    function asFunction(value: any, nullOK?: boolean): Function;
    /**
    * Checks that a value is an array.
    *
    * @param value Value supposed to be an array.
    * @param nullOK Whether null values are acceptable.
    * @return The array passed in.
    */
    function asArray(value: any, nullOK?: boolean): any[];
    /**
    * Checks that a value is an instance of a given type.
    *
    * @param value Value to be checked.
    * @param type Type of value expected.
    * @param nullOK Whether null values are acceptable.
    * @return The value passed in.
    */
    function asType(value: any, type: any, nullOK?: boolean): any;
    /**
    * Checks that a value is a valid setting for an enumeration.
    *
    * @param value Value supposed to be a member of the enumeration.
    * @param enumType Enumeration to test for.
    * @param nullOK Whether null values are acceptable.
    * @return The value passed in.
    */
    function asEnum(value: number, enumType: any, nullOK?: boolean): number;
    /**
    * Checks that a value is an @see:ICollectionView or an Array.
    *
    * @param value Array or @see:ICollectionView.
    * @param nullOK Whether null values are acceptable.
    * @return The @see:ICollectionView that was passed in or a @see:CollectionView
    * created from the array that was passed in.
    */
    function asCollectionView(value: any, nullOK?: boolean): collections.ICollectionView;
    /**
    * Escapes a string by replacing HTML characters as text entities.
    *
    * Strings entered by uses should always be escaped before they are displayed
    * in HTML pages. This ensures page integrity and prevents HTML/javascript
    * injection attacks.
    *
    * @param text Text to escape.
    * @return An HTML-escaped version of the original string.
    */
    function escapeHtml(text: string): string;
    /**
    * Checks whether an element has a class.
    *
    * @param e Element to check.
    * @param className Class to check for.
    */
    function hasClass(e: HTMLElement, className: string): boolean;
    /**
    * Removes a class from an element.
    *
    * @param e Element that will have the class removed.
    * @param className Class to remove form the element.
    */
    function removeClass(e: HTMLElement, className: string): void;
    /**
    * Adds a class to an element.
    *
    * @param e Element that will have the class added.
    * @param className Class to add to the element.
    */
    function addClass(e: HTMLElement, className: string): void;
    /**
    * Adds or removes a class to or from an element.
    *
    * @param e Element that will have the class added.
    * @param className Class to add or remove.
    * @param addOrRemove Whether to add or remove the class.
    */
    function toggleClass(e: HTMLElement, className: string, addOrRemove: boolean): void;
    /**
    * Determines whether the current device is touch-enabled.
    */
    function isTouchDevice(): boolean;
    /**
    * Class that represents a point (with x and y coordinates).
    */
    class Point {
        /**
        * Gets or sets the x coordinate of this @see:Point.
        */
        public x: number;
        /**
        * Gets or sets the y coordinate of this @see:Point.
        */
        public y: number;
        /**
        * Initializes a new instance of a @see:Point object.
        *
        * @param x X coordinate of the new Point.
        * @param y Y coordinate of the new Point.
        */
        constructor(x?: number, y?: number);
        /**
        * Returns true if a @see:Point has the same coordinates as this @see:Point.
        *
        * @param pt @see:Point to compare to this @see:Point.
        * @return True if a @see:Point has the same coordinates as this @see:Point.
        */
        public equals(pt: Point): boolean;
        /**
        * Creates a copy of this @see:Point.
        *
        * @return A copy of this @see:Point.
        */
        public clone(): Point;
    }
    /**
    * Class that represents a size (with width and height).
    */
    class Size {
        /**
        * Gets or sets the width of this @see:Size.
        */
        public width: number;
        /**
        * Gets or sets the height of this @see:Size.
        */
        public height: number;
        /**
        * Initializes a new instance of a @see:Size object.
        *
        * @param width Width of the new @see:Size.
        * @param height Height of the new @see:Size.
        */
        constructor(width?: number, height?: number);
        /**
        * Returns true if a @see:Size has the same dimensions as this @see:Size.
        *
        * @param sz @see:Size to compare to this @see:Size.
        * @return True if a @see:Size has the same dimensions as this @see:Size.
        */
        public equals(sz: Size): boolean;
        /**
        * Creates a copy of this @see:Size.
        *
        * @return A copy of this @see:Size.
        */
        public clone(): Size;
    }
    /**
    * Class that represents a rectangle (with left, top, width, and height).
    */
    class Rect {
        /**
        * Gets or sets the left coordinate of this @see:Rect.
        */
        public left: number;
        /**
        * Gets or sets the top coordinate of this @see:Rect.
        */
        public top: number;
        /**
        * Gets or sets the width of this @see:Rect.
        */
        public width: number;
        /**
        * Gets or sets the height of this @see:Rect.
        */
        public height: number;
        /**
        * Initializes a new instance of a @see:Rect object.
        *
        * @param left Left coordinate of the new @see:Rect.
        * @param top Top coordinate of the new @see:Rect.
        * @param width Width of the new @see:Rect.
        * @param height Height of the new @see:Rect.
        */
        constructor(left: number, top: number, width: number, height: number);
        /**
        * Gets the right coordinate of this @see:Rect.
        */
        public right : number;
        /**
        * Gets the bottom coordinate of this @see:Rect.
        */
        public bottom : number;
        /**
        * Creates a copy of this @see:Rect.
        *
        * @return A copy of this @see:Rect.
        */
        public clone(): Rect;
        /**
        * Creates a @see:Rect from objects returned by the <b>getBoundingClientRect</b>
        * method.
        *
        * @param rc Rectangle obtained by a call to the <b>getBoundingClientRect</b> method.
        *
        * @return A new @see:Rect.
        */
        static fromBoundingRect(rc: ClientRect): Rect;
    }
    /**
    * Provides date and time utilities.
    */
    class DateTime {
        /**
        * Gets a new Date that adds the specified number of days to a given Date.
        *
        * @param value Original date.
        * @param days Number of days to add to the given date.
        * @return A new Date object that adds the specified number of days to a given Date.
        */
        static addDays(value: Date, days: number): Date;
        /**
        * Gets a new Date that adds the specified number of months to a given Date.
        *
        * @param value Original date.
        * @param months Number of months to add to the given date.
        * @return A new Date object that adds the specified number of months to a given Date.
        */
        static addMonths(value: Date, months: number): Date;
        /**
        * Gets a new Date that adds the specified number of years to a given Date.
        *
        * @param value Original date.
        * @param years Number of years to add to the given date.
        * @return A new Date object that adds the specified number of years to a given Date.
        */
        static addYears(value: Date, years: number): Date;
        /**
        * Gets a new Date that adds the specified number of hours to a given Date.
        *
        * @param value Original date.
        * @param hours Number of hours to add to the given date.
        * @return A new Date object that adds the specified number of hours to a given Date.
        */
        static addHours(value: Date, hours: number): Date;
        /**
        * Gets a new Date that adds the specified number of minutes to a given Date.
        *
        * @param value Original date.
        * @param minutes Number of minutes to add to the given date.
        * @return A new Date object that adds the specified number of minutes to a given Date.
        */
        static addMinutes(value: Date, minutes: number): Date;
        /**
        * Gets a new Date that adds the specified number of seconds to a given Date.
        *
        * @param value Original date.
        * @param seconds Number of seconds to add to the given date.
        * @return A new Date object that adds the specified number of seconds to a given Date.
        */
        static addSeconds(value: Date, seconds: number): Date;
        /**
        * Returns true if two Date objects refer to the same date (ignoring time).
        *
        * @param d1 First date.
        * @param d2 Second date.
        * @return True if two Date objects refer to the same date (ignoring time).
        */
        static sameDate(d1: Date, d2: Date): boolean;
        /**
        * Returns true if two Date objects refer to the same time (ignoring date).
        *
        * @param d1 First date.
        * @param d2 Second date.
        * @return True if two Date objects refer to the same time (ignoring date).
        */
        static sameTime(d1: Date, d2: Date): boolean;
        /**
        * Returns true if two Date objects refer to the same date and time.
        *
        * @param d1 First date.
        * @param d2 Second date.
        * @return True if two Date objects refer to the same date and time.
        */
        static equals(d1: Date, d2: Date): boolean;
        /**
        * Gets a Date object with the date and time set on two Date objects.
        *
        * @param date Date object that contains the date (day/month/year).
        * @param time Date object that contains the time (hour:minute:second).
        * @return A Date object with the date and time values copied from the date and time parameters.
        */
        static fromDateTime(date: Date, time: Date): Date;
        /**
        * Creates a copy of a given Date object.
        *
        * @param date Date object to copy.
        * @return A copy of the Date object passed in.
        */
        static clone(date: Date): Date;
    }
}

declare module wijmo {
    /**
    * Gets or sets an object that contains all localizable strings in the Wijmo library.
    *
    * The culture selector is a two-letter string that represents an
    * <a href='http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes'>ISO 639 culture</a>.
    */
    var culture: any;
    /**
    * Class that implements formatting and parsing of numbers and Dates.
    *
    * By default, @see:Globalize uses the American English culture.
    * To switch cultures, include the appropriate <b>wijmo.culture.*.js</b>
    * file after the wijmo files.
    */
    class Globalize {
        /**
        * Formats a number or a date.
        *
        * The format strings used with the @see:format function are similar to
        * the ones used by <b>Globalize.js</b> and by the .NET Globalization
        * library. The tables below contains links that describe the formats
        * available:
        *
        * <ul>
        * <li><a href="http://msdn.microsoft.com/en-us/library/dwhawy9k(v=vs.110).aspx">
        *      Numeric Format Strings</a></li>
        * <li><a href="http://msdn.microsoft.com/en-us/library/az4se3k1(v=vs.110).aspx">
        *      Standard Date and Time Format Strings</a></li>
        * <li><a href="http://msdn.microsoft.com/en-us/library/8kb3ddd4(v=vs.110).aspx">
        *      Custom Date and Time Format Strings</a></li>
        * </ul>
        *
        * @param value Number or Date to format.
        * @param format Format string to use when formatting numbers or dates.
        * @return A string representation of the given number or date.
        */
        static format(value: any, format: string): string;
        /**
        * Formats a number using the current culture.
        *
        * @param value Number to format.
        * @param format .NET-style standard numeric format string (e.g. 'n2', 'c4', 'p0').
        * @return A string representation of the given number.
        */
        static formatNumber(value: number, format: string): string;
        /**
        * Formats a date using the current culture.
        *
        * @param value Number or Date to format.
        * @param format .NET-style <a href="http://msdn.microsoft.com/en-us/library/8kb3ddd4(v=vs.110).aspx">Date format string</a>.
        * @return A string representation of the given date.
        */
        static formatDate(value: Date, format: string): string;
        /**
        * Parses a string into an integer.
        *
        * @param value String to convert to an integer.
        * @return The integer represented by the given string,
        * or <b>NaN</b> if the string cannot be parsed into an integer.
        */
        static parseInt(value: string): number;
        /**
        * Parses a string into a floating point number.
        *
        * @param value String to convert to a number.
        * @return The floating point number represented by the given string,
        * or <b>NaN</b> if the string cannot be parsed into a floating point number.
        */
        static parseFloat(value: string): number;
        /**
        * Parses a string into a Date.
        *
        * @param value String to convert to a Date.
        * @param format Format string used to parse the date.
        * @return The date represented by the given string, or null if the string
        * cannot be parsed into a Date.
        */
        static parseDate(value: string, format: string): Date;
        /**
        * Gets the first day of the week according to the current culture.
        *
        * The value returned is between zero (Sunday) and six (Saturday).
        */
        static getFirstDayOfWeek(): number;
        /**
        * Gets the symbol used as a decimal separator in numbers.
        */
        static getNumberDecimalSeparator(): string;
        private static _formatDatePart(d, format, part);
        private static _getEra(d, cal);
        private static _expandFormat(format);
        private static _zeroPad(num, places);
        private static _h12(d);
    }
}

declare module wijmo {
    /**
    * Represents an event handler.
    * Event handlers are functions invoked when events are raised.
    *
    * Every event handler has two arguments:
    * <ul>
    *   <li><b>sender</b> is the object that raised the event, and</li>
    *   <li><b>args</b> is an optional object that contains the event parameters.</li>
    * </ul>
    */
    interface IEventHandler {
        (sender: any, args: EventArgs): void;
    }
    /**
    * Represents an event.
    *
    * Wijmo events are similar to .NET events. Any class may define events by
    * declaring them as fields. Any class may subscribe to events using the
    * event's @see:addHandler method, or unsubscribe using the @see:removeHandler
    * method.
    *
    * Wijmo event handlers take two parameters: <i>sender</i> and <i>args</i>.
    * The first is the object that raised the event, and the second is an object
    * that contains the the event parameters.
    *
    * Classes that define events follow the .NET pattern where for every event
    * there is an <i>on[EVENTNAME]</i> method that raises the event. This pattern
    * allows derived classes to override the <i>on[EVENTNAME]</i> method and
    * handle the event before and/or after the base class raises the event.
    * Derived classes may even suppress the event by not calling the base class
    * implementation.
    *
    * For example, the TypeScript code below overrides the <b>onValueChanged</b>
    * event for a control to perform some processing before and after the
    * <b>valueChanged</b> event fires:
    * <pre>
    *   // override base class
    *   onValueChanged(e: EventArgs) {
    *   // execute some code before the event fires
    *   console.log('about to fire valueChanged');
    *   // optionally, call base class to fire the event
    *   super.onValueChanged(e);
    *   // execute some code after the event fired
    *   console.log('valueChanged event just fired');
    * }
    * </pre>
    */
    class Event {
        private _handlers;
        /**
        * Adds a handler to this event.
        *
        * @param handler Function invoked when the event is raised.
        * @param self Object that defines the event handler
        * (accessible as 'this' from the handler code).
        */
        public addHandler(handler: IEventHandler, self?: any): void;
        /**
        * Removes a handler from this event.
        *
        * @param handler Function invoked when the event is raised.
        * @param self Object that defines the event handler (accessible as 'this' from the handler code).
        */
        public removeHandler(handler: IEventHandler, self?: any): void;
        /**
        * Removes all handlers associated with this event.
        */
        public removeAllHandlers(): void;
        /**
        * Raises this event, causing all associated handlers to be invoked.
        *
        * @param sender Source object.
        * @param args Event parameters.
        */
        public raise(sender: any, args?: EventArgs): void;
    }
    /**
    * Base class for event arguments.
    */
    class EventArgs {
        /**
        * Provides a value to use with events that do not have event data.
        */
        static empty: EventArgs;
    }
    /**
    * Provides arguments for cancellable events.
    */
    class CancelEventArgs extends EventArgs {
        /**
        * Gets or sets a value that indicates whether the event should be canceled.
        */
        public cancel: boolean;
    }
}

declare module wijmo {
    /**
    * Base class for all Wijmo controls.
    *
    * The @see:Control class handles the association between DOM elements and the
    * actual control. Use the @see:hostElement property to get the DOM element
    * that is hosting a control, or the @see:getControl method to get the control
    * hosted in a given DOM element.
    *
    * The @see:Control class also provides a common pattern for invalidating and
    * refreshing controls, for updating the control layout when its size changes,
    * and for handling the HTML templates that define the control structure.
    *
    * @see controlTemplate
    * @see invalidate
    * @see refresh
    */
    class Control {
        private static _DATA_KEY;
        private static _REFRESH_INTERVAL;
        private _updating;
        private _toInvalidate;
        private _szCtl;
        private _e;
        private _orgOuter;
        private _orgInner;
        public _orgTag: string;
        public _orgAtts: NamedNodeMap;
        /**
        * Initializes a new instance of a @see:Control and attaches it to a DOM element.
        *
        * @param element The DOM element that will host the control, or a jQuery selector (e.g. '#theCtrl').
        * @param options Javascript object containing initialization data for the control.
        * @param invalidateOnResize Whether the control should be invalidated when it is resized.
        */
        constructor(element: any, options?: any, invalidateOnResize?: boolean);
        /**
        * Gets the HTML template used to create instances of the control.
        *
        * This method traverses up the class hierarchy to find the nearest ancestor that
        * specifies a control template. For example, if you specify a prototype for the
        * @see:ComboBox control, it will override the template defined by the @see:DropDown
        * base class.
        *
        * @return The current template.
        */
        public getTemplate(): string;
        /**
        * Applies the template to a new instance of a control.
        *
        * This method should be called by constructors of templated controls.
        * It is responsible for binding the template parts to the
        * corresponding control members.
        *
        * For example, the code below applies a template to an instance
        * of an @see:InputNumber control. The template must contain elements
        * with the 'wj-part' attribute set to 'input', 'btn-inc', and 'btn-dec'.
        * The control members '_tbx', '_btnUp', and '_btnDn' will be assigned
        * references to these elements.
        *
        * <pre>this.applyTemplate('wj-control wj-inputnumber', template, {
        *   _tbx: 'input',
        *   _btnUp: 'btn-inc',
        *   _btnDn: 'btn-dec'
        * }, 'input');</pre>
        *
        * @param classNames Names of classes to add to the control's host element.
        * @param template A jQuery variable that contains the instantiated template.
        * @param parts A dictionary of part variables and their names.
        * @param namePart Name of the part to be named after the host element. This
        * determines how the control submits data when used in forms.
        */
        public applyTemplate(classNames: string, template: JQuery, parts: Object, namePart?: string): void;
        /**
        * Disposes of the control by removing its association with the host element.
        */
        public dispose(): void;
        /**
        * Gets the control that is hosted in a given DOM element.
        *
        * @param element The DOM element that is hosting the control, or a jQuery selector (e.g. '#theCtrl').
        * @return The control hosted in the DOM element.
        */
        static getControl(element: any): Control;
        /**
        * Gets the DOM element that is hosting the control.
        *
        * @return The DOM element that is hosting the control.
        */
        public hostElement : HTMLElement;
        /**
        * Sets the focus to this control.
        */
        public focus(): void;
        /**
        * Checks whether this control contains the focused element.
        *
        * @return True if the control contains the focused element.
        */
        public containsFocus(): boolean;
        /**
        * Invalidates the control causing an asynchronous refresh.
        *
        * @param fullUpdate Whether to update the control layout as well as the content.
        */
        public invalidate(fullUpdate?: boolean): void;
        /**
        * Refreshes the control.
        *
        * @param fullUpdate Whether to update the control layout as well as the content.
        */
        public refresh(fullUpdate?: boolean): void;
        /**
        * Suspends notifications until the next call to @see:endUpdate.
        */
        public beginUpdate(): void;
        /**
        * Resumes notifications suspended by calls to @see:beginUpdate.
        */
        public endUpdate(): void;
        /**
        * Gets a value that indicates whether the control is currently being updated.
        */
        public isUpdating : boolean;
        /**
        * Executes a function within a @see:beginUpdate/@see:endUpdate block.
        *
        * The control will not be updated until the function has been executed.
        * This method ensures @see:endUpdate is called even if the function throws.
        *
        * @param fn Function to be executed.
        */
        public deferUpdate(fn: Function): void;
        /**
        * Initializes the control by copying the properties from a given object.
        *
        * This method allows you to initialize controls using plain data objects
        * instead of setting the value of each property in code.
        *
        * For example:
        * <pre>
        * grid.initialize({
        *   itemsSource: myList,
        *   autoGenerateColumns: false,
        *   columns: [{ binding: 'ID', header: 'Code', width: 130 }, ... }]
        * });
        * // is equivalent to
        * grid.itemsSource = myList;
        * grid.autoGenerateColumns = false;
        * // etc.
        * </pre>
        *
        * The initialization data is type-checked as it is set. If the
        * initialization object contains unknown property names or invalid
        * data types, this method will throw.
        *
        * @param options Object that contains the initialization data.
        */
        public initialize(options: any): void;
        private _handleWindowResize();
        private _replaceWithDiv(element);
        public _copyOriginalAttributes(e: HTMLElement): void;
    }
}

/**
* Defines interfaces and classes related to data, including the @see:ICollectionView
* interface and the @see:CollectionView class and @see:ObservableArray classes.
*/ 
declare module wijmo.collections {
    /**
    * Notifies listeners of dynamic changes, such as when items get added and
    * removed or when the collection is sorted, filtered, or grouped.
    */
    interface INotifyCollectionChanged {
        /**
        * Occurs when the collection changes.
        */
        collectionChanged: Event;
    }
    /**
    * Describes the action that caused the @see:collectionChanged event.
    */
    enum NotifyCollectionChangedAction {
        /** An item was added to the collection. */
        Add = 0,
        /** An item was removed from the collection. */
        Remove = 1,
        /** An item was changed or replaced. */
        Change = 2,
        /**
        * Several items changed simultaneously
        * (for example, the collection was sorted, filtered, or grouped).
        */
        Reset = 3,
    }
    /**
    * Provides data for the @see:collectionChanged event.
    */
    class NotifyCollectionChangedEventArgs extends EventArgs {
        /**
        * Provides a reset notification.
        */
        static reset: NotifyCollectionChangedEventArgs;
        /**
        * Gets the action that caused the event.
        */
        public action: NotifyCollectionChangedAction;
        /**
        * Gets the item that was added, removed, or changed.
        */
        public item: any;
        /**
        * Gets the index at which the change occurred.
        */
        public index: number;
        /**
        * Initializes a new instance of an @see:NotifyCollectionChangedEventArgs.
        *
        * @param action Type of action that caused the event to fire.
        * @param item Item that was added or changed.
        * @param index Index of the item.
        */
        constructor(action?: NotifyCollectionChangedAction, item?: any, index?: number);
    }
    /**
    * Represents a method that takes an item of any type and returns a
    * boolean that indicates whether the object meets a set of criteria.
    */
    interface IPredicate {
        (item: any): boolean;
    }
    /**
    * Represents the method that compares two objects.
    */
    interface IComparer {
        (x: any, y: any): number;
    }
    /**
    * Describes a sorting criterion.
    */
    class SortDescription {
        public _prop: string;
        public _asc: boolean;
        /**
        * Initializes a new instance of a @see:SortDescription.
        *
        * @param property Name of the property to sort on.
        * @param ascending Whether to sort in ascending order.
        */
        constructor(property: string, ascending: boolean);
        /**
        * Gets the name of the property used to sort.
        */
        public property : string;
        /**
        * Gets a value that determines whether to sort the values in ascending order.
        */
        public ascending : boolean;
    }
    /**
    * Enables collections to have the functionalities of current record management,
    * custom sorting, filtering, and grouping.
    *
    * This is a JavaScript version of the <b>ICollectionView</b> interface used in
    * Microsoft's XAML platform. It provides a consistent, powerful, and  MVVM-friendly
    * way to bind data to UI elements.
    *
    * Wijmo includes several classes that implement @see:ICollectionView. The most
    * common is @see:CollectionView, which works based on regular JavsScript
    * arrays.
    */
    interface ICollectionView extends INotifyCollectionChanged, IQueryInterface {
        /**
        * Gets a value that indicates whether this view supports filtering via the
        * @see:filter property.
        */
        canFilter: boolean;
        /**
        * Gets a value that indicates whether this view supports grouping via the
        * @see:groupDescriptions property.
        */
        canGroup: boolean;
        /**
        * Gets a value that indicates whether this view supports sorting via the
        * @see:sortDescriptions property.
        */
        canSort: boolean;
        /**
        * Gets the current item in the view.
        */
        currentItem: any;
        /**
        * Gets the ordinal position of the current item in the view.
        */
        currentPosition: number;
        /**
        * Gets or sets a callback used to determine if an item is suitable for
        * inclusion in the view.
        *
        * NOTE: If the filter function needs a scope (i.e. a meaningful 'this'
        * value), then remember to set the filter using the 'bind' function to
        * specify the 'this' object. For example:
        * <pre>
        *   collectionView.filter = this._filter.bind(this);
        * </pre>
        */
        filter: IPredicate;
        /**
        * Gets a collection of @see:GroupDescription objects that describe how the
        * items in the collection are grouped in the view.
        */
        groupDescriptions: ObservableArray;
        /**
        * Gets the top-level groups.
        */
        groups: any[];
        /**
        * Gets a value that indicates whether this view contains no items.
        */
        isEmpty: boolean;
        /**
        * Gets a collection of @see:SortDescription objects that describe how the items
        * in the collection are sorted in the view.
        */
        sortDescriptions: ObservableArray;
        /**
        * Gets or sets the collection object from which to create this view.
        */
        sourceCollection: any;
        /**
        * Returns a value that indicates whether a given item belongs to this view.
        *
        * @param item The item to locate in the collection.
        */
        contains(item: any): boolean;
        /**
        * Sets the specified item to be the current item in the view.
        *
        * @param item The item to set as the @see:currentItem.
        */
        moveCurrentTo(item: any): boolean;
        /**
        * Sets the first item in the view as the current item.
        */
        moveCurrentToFirst(): boolean;
        /**
        * Sets the last item in the view as the current item.
        */
        moveCurrentToLast(): boolean;
        /**
        * Sets the item after the current item in the view as the current item.
        */
        moveCurrentToNext(): boolean;
        /**
        * Sets the item at the specified index in the view as the current item.
        *
        * @param index The index of the item to set as the @see:currentItem.
        */
        moveCurrentToPosition(index: number): boolean;
        /**
        * Sets the item before the current item in the view as the current item.
        */
        moveCurrentToPrevious(): any;
        /**
        * Re-creates the view using the current sort, filter, and group parameters.
        */
        refresh(): any;
        /**
        * Occurs after the current item changes.
        */
        currentChanged: Event;
        /**
        * Occurs before the current item changes.
        */
        currentChanging: Event;
        /**
        * Suspends refreshes until the next call to @see:endUpdate.
        */
        beginUpdate(): any;
        /**
        * Resumes refreshes suspended by a call to @see:beginUpdate.
        */
        endUpdate(): any;
        /**
        * Executes a function within a beginUpdate/endUpdate block.
        *
        * The collection will not be refreshed until the function has been executed.
        * This method ensures endUpdate is called even if the function throws.
        *
        * @param fn Function to be executed within the beginUpdate/endUpdate block.
        */
        deferUpdate(fn: Function): any;
        /**
        * Gets the filtered, sorted, grouped items in the view.
        */
        items: any[];
    }
    /**
    * Defines methods and properties that extend @see:ICollectionView to provide
    * editing capabilities.
    */
    interface IEditableCollectionView extends ICollectionView {
        /**
        * Gets a value that indicates whether a new item can be added to the collection.
        */
        canAddNew: boolean;
        /**
        * Gets a value that indicates whether the collection view can discard pending changes
        * and restore the original values of an edited object.
        */
        canCancelEdit: boolean;
        /**
        `        * Gets a value that indicates whether items can be removed from the collection.
        */
        canRemove: boolean;
        /**
        `        * Gets the item that is being added during the current add transaction.
        */
        currentAddItem: any;
        /**
        `        * Gets the item that is being edited during the current edit transaction.
        */
        currentEditItem: any;
        /**
        `        * Gets a value that indicates whether an add transaction is in progress.
        */
        isAddingNew: boolean;
        /**
        `        * Gets a value that indicates whether an edit transaction is in progress.
        */
        isEditingItem: boolean;
        /**
        `        * Adds a new item to the collection.
        *
        * @return The new item that was added to the collection..
        */
        addNew(): any;
        /**
        * Ends the current edit transaction and, if possible,
        * restores the original value to the item.
        */
        cancelEdit(): any;
        /**
        * Ends the current add transaction and discards the pending new item.
        */
        cancelNew(): any;
        /**
        * Ends the current edit transaction and saves the pending changes.
        */
        commitEdit(): any;
        /**
        * Ends the current add transaction and saves the pending new item.
        */
        commitNew(): any;
        /**
        * Begins an edit transaction of the specified item.
        *
        * @param item Item to edit.
        */
        editItem(item: any): any;
        /**
        * Removes the specified item from the collection.
        *
        * @param item Item to remove from the collection.
        */
        remove(item: any): any;
        /**
        * Removes the item at the specified index from the collection.
        *
        * @param index Index of the item to remove from the collection.
        */
        removeAt(index: number): any;
    }
    /**
    * Defines methods and properties that extend @see:ICollectionView to provide
    * paging capabilities.
    */
    interface IPagedCollectionView extends ICollectionView {
        /**
        `        * Gets a value that indicates whether the @see:pageIndex value can change.
        */
        canChangePage: boolean;
        /**
        `        * Gets a value that indicates whether the index is changing.
        */
        isPageChanging: boolean;
        /**
        `        * Gets the number of items in the view taking paging into account.
        *
        * To get the total number of items, use the @see:totalItemCount property.
        *
        * Notice that this is different from the .NET <b>IPagedCollectionView</b>,
        * where <b>itemCount</b> and <b>totalItemCount</b> both return the count
        * before paging is applied.
        */
        itemCount: number;
        /**
        `        * Gets the zero-based index of the current page.
        */
        pageIndex: number;
        /**
        `        * Gets or sets the number of items to display on a page.
        */
        pageSize: number;
        /**
        `        * Gets the total number of items in the view before paging is applied.
        *
        * To get the number of items in the current view not taking paging into
        * account, use the @see:itemCount property.
        *
        * Notice that this is different from the .NET <b>IPagedCollectionView</b>,
        * where <b>itemCount</b> and <b>totalItemCount</b> both return the count
        * before paging is applied.
        */
        totalItemCount: number;
        /**
        * Sets the first page as the current page.
        */
        moveToFirstPage(): boolean;
        /**
        * Sets the last page as the current page.
        */
        moveToLastPage(): boolean;
        /**
        * Moves to the page after the current page.
        */
        moveToNextPage(): boolean;
        /**
        * Moves to the page at the specified index.
        *
        * @param index Index of the page to move to.
        */
        moveToPage(index: number): boolean;
        /**
        * Moves to the page before the current page.
        */
        moveToPreviousPage(): boolean;
        /**
        * Occurs after the page index changes.
        */
        pageChanged: Event;
        /**
        * Occurs before the page index changes.
        */
        pageChanging: Event;
    }
    /**
    * Provides data for the @see:IPagedCollectionView.pageChanging event
    */
    class PageChangingEventArgs extends CancelEventArgs {
        /**
        * Gets the index of the page that is about to become current.
        */
        public newPageIndex: number;
        /**
        * Initializes a new instance of a @see:PageChangingEventArgs.
        *
        * @param newIndex Index of the page that is about to become current.
        */
        constructor(newIndex: number);
    }
    /**
    * Represents a base class for types defining grouping conditions.
    *
    * The concrete class which is commonly used for this purpose is
    * @see:PropertyGroupDescription.
    */
    class GroupDescription {
        /**
        * Returns the group name for the given item.
        *
        * @param item The item to get group name for.
        * @param level The zero-based group level index.
        * @return The name of the group the item belongs to.
        */
        public groupNameFromItem(item: any, level: number): any;
        /**
        * Returns a value that indicates whether the group name and the item name
        * match (which implies that the item belongs to the group).
        *
        * @param groupName The name of the group.
        * @param itemName The name of the item.
        * @return True if the names match; otherwise, false.
        */
        public namesMatch(groupName: any, itemName: any): boolean;
    }
    /**
    * Describes the grouping of items using a property name as the criterion.
    *
    * For example, the code below causes a @see:CollectionView to group items
    * by the value of their 'country' property:
    * <pre>
    * var cv = new wijmo.collections.CollectionView(items);
    * var gd = new wijmo.collections.PropertyGroupDescription('country');
    * cv.groupDescriptions.push(gd);
    * </pre>
    *
    * You may also specify a callback function that generates the group name.
    * For example, the code below causes a @see:CollectionView to group items
    * by the first letter of the value of their 'country' property:
    * <pre>
    * var cv = new wijmo.collections.CollectionView(items);
    * var gd = new wijmo.collections.PropertyGroupDescription('country',
    *   function(item, propName) {
    *     return item[propName][0]; // return country's initial
    * });
    * cv.groupDescriptions.push(gd);
    * </pre>
    */
    class PropertyGroupDescription extends GroupDescription {
        public _propName: string;
        public _converter: Function;
        /**
        * Initializes a new instance of a @see:PropertyGroupDescription.
        *
        * @param propertyName The name of the property that specifies
        * which group an item belongs to.
        * @param converter A callback function that takes an item and
        * a property name and returns the group name. If not specified,
        * the group name is the property value for the item.
        */
        constructor(propertyName: string, converter?: Function);
        public propertyName : string;
        /**
        * Returns the group name for the given item.
        *
        * @param item The item to get group name for.
        * @param level The zero-based group level index.
        * @return The name of the group the item belongs to.
        */
        public groupNameFromItem(item: any, level: number): any;
        /**
        * Returns a value that indicates whether the group name and the item name
        * match (which implies that the item belongs to the group).
        *
        * @param groupName The name of the group.
        * @param itemName The name of the item.
        * @return True if the names match; otherwise, false.
        */
        public namesMatch(groupName: any, itemName: any): boolean;
    }
}

declare module wijmo {
    /**
    * Specifies the type of aggregate to calculate over a group of values.
    */
    enum Aggregate {
        /**
        * No aggregate.
        */
        None = 0,
        /**
        * Returns the sum of the numeric values in the group.
        */
        Sum = 1,
        /**
        * Returns the count of non-null values in the group.
        */
        Cnt = 2,
        /**
        * Returns the average value of the numeric values in the group.
        */
        Avg = 3,
        /**
        * Returns the maximum value in the group.
        */
        Max = 4,
        /**
        * Returns the minimum value in the group.
        */
        Min = 5,
        /**
        * Returns the difference between the maximum and minimum numeric values in the group.
        */
        Rng = 6,
        /**
        * Returns the sample standard deviation of the numeric values in the group
        * (uses the formula based on n-1).
        */
        Std = 7,
        /**
        * Returns the sample variance of the numeric values in the group
        * (uses the formula based on n-1).
        */
        Var = 8,
        /**
        * Returns the population standard deviation of the values in the group
        * (uses the formula based on n).
        */
        StdPop = 9,
        /**
        * Returns the population variance of the values in the group
        * (uses the formula based on n).
        */
        VarPop = 10,
    }
    /**
    * Calculates an aggregate value from the values in an array.
    *
    * @param aggType Type of aggregate to calculate.
    * @param items Array with the items to aggregate.
    * @param binding Name of the property to aggregate on (in case the items are not simple values).
    * @return The aggregate value.
    */
    function getAggregate(aggType: Aggregate, items: any[], binding?: string): any;
}

declare module wijmo.collections {
    /**
    * Base class for Array classes with notifications.
    */
    class ArrayBase {
        /**
        * Initializes a new instance of an @see:ArrayBase.
        */
        constructor();
        public pop(): any;
        public push(value: any): number;
        public splice(index: number, count: number, value?: any): any[];
        public slice(begin: number, end?: number): any[];
        public indexOf(searchElement: any, fromIndex?: number): number;
        public sort(compareFn?: Function): any[];
        public length: number;
    }
    /**
    * Array that sends notifications on changes.
    *
    * The class raises the @see:collectionChanged event when changes are made with
    * the push, pop, splice, insert, or remove methods.
    *
    * Warning: Changes made by assigning values directly to array members or to the
    * length of the array do not raise the @see:collectionChanged event.
    */
    class ObservableArray extends ArrayBase implements INotifyCollectionChanged {
        private _updating;
        /**
        * Appends an item to the array.
        *
        * @param item Item to add to the array.
        * @return The new length of the array.
        */
        public push(item: any): number;
        public pop(): any;
        /**
        * Removes and/or adds items to the array.
        *
        * @param index Position where items will be added or removed.
        * @param count Number of items to remove from the array.
        * @param item Item to add to the array.
        * @return An array containing the removed elements.
        */
        public splice(index: number, count: number, item?: any): any[];
        /**
        * Creates a shallow copy of a portion of an array.
        *
        * @param begin Position where the copy starts.
        * @param end Position where the copy ends.
        * @return A shallow copy of a portion of an array.
        */
        public slice(begin?: number, end?: number): any[];
        /**
        * Searches for an item in the array.
        *
        * @param searchElement Element to locate in the array.
        * @param fromIndex The index where the search should start.
        * @return The index of the item in the array, or -1 if the item was not found.
        */
        public indexOf(searchElement: any, fromIndex?: number): number;
        /**
        * Sorts the elements of the array in place.
        *
        * @param compareFn Specifies a function that defines the sort order.
        * If specified, the function should take two arguments and should return
        * -1, +1, or 0 to indicate the first argument is smaller, greater than,
        * or equal to the second argument.
        * If omitted, the array is sorted in dictionary order according to the
        * string conversion of each element.
        * @return A copy of the sorted array.
        */
        public sort(compareFn?: Function): any[];
        /**
        * Inserts an item at a specific position in the array.
        *
        * @param index Position where the item will be added.
        * @param item Item to add to the array.
        */
        public insert(index: number, item: any): void;
        /**
        * Removes an item at a specific position in the array.
        *
        * @param index Position of the item to remove.
        */
        public removeAt(index: number): void;
        /**
        * Assigns an item at a specific position in the array.
        *
        * @param index Position where the item will be assigned.
        * @param item Item to assign to the array.
        */
        public setAt(index: number, item: any): void;
        /**
        * Removes all items from the array.
        */
        public clear(): void;
        /**
        * Suspends notifications until the next call to @see:endUpdate.
        */
        public beginUpdate(): void;
        /**
        * Resumes notifications suspended by a call to @see:beginUpdate.
        */
        public endUpdate(): void;
        /**
        * Gets a value that indicates whether notifications are currently suspended
        * (see @see:beginUpdate and @see:endUpdate).
        */
        public isUpdating : boolean;
        /**
        * Executes a function within a @see:beginUpdate/@see:endUpdate block.
        *
        * The collection will not be refreshed until the function finishes.
        * This method ensures @see:endUpdate is called even if the function throws.
        *
        * @param fn Function to be executed without updates.
        */
        public deferUpdate(fn: Function): void;
        /**
        * Returns true if the caller queries for a supported interface.
        *
        * @param interfaceName Name of the interface to look for.
        * @return True if the caller queries for a supported interface.
        */
        public implementsInterface(interfaceName: string): boolean;
        /**
        * Occurs when the collection changes.
        */
        public collectionChanged: Event;
        /**
        * Raises the @see:collectionChanged event.
        *
        * @param e Contains a description of the change.
        */
        public onCollectionChanged(e?: NotifyCollectionChangedEventArgs): void;
        private _raiseCollectionChanged(action?, item?, index?);
    }
}

declare module wijmo.collections {
    /**
    * Class that implements the @see:ICollectionView interface to expose data in
    * regular JavaScript arrays.
    *
    * The @see:CollectionView class implements the following interfaces:
    * <ul>
    *   <li>@see:ICollectionView: provides current record management,
    *       custom sorting, filtering, and grouping.</li>
    *   <li>@see:IEditableCollectionView: provides methods for editing,
    *       adding, and removing items.</li>
    *   <li>@see:IPagedCollectionView: provides paging.</li>
    * </ul>
    *
    * To use the @see:CollectionView class, start by declaring it and passing a
    * regular array as a data source. Then configure the view using the
    * @see:filter, @see:sortDescriptions, @see:groupDescriptions, and
    * @see:pageSize properties. Finally, access the view using the @see:items
    * property. For example:
    *
    * <pre>
    *   // create a new CollectionView
    *   var cv = new wijmo.collections.CollectionView(myArray);
    *   // sort items by amount in descending order
    *   var sd = new wijmo.collections.SortDescription('amount', false);
    *   cv.sortDescriptions.push(sd);
    *   // show only items with amounts greater than 100
    *   cv.filter = function(item) { return item.amount > 100 };
    *   // show the sorted, filtered result on the console
    *   for (var i = 0; i &lt; cv.items.length; i++) {
    *     var item = cv.items[i];
    *     console.log(i + ': ' + item.name + ' ' + item.amount);
    *   }
    * </pre>
    */
    class CollectionView implements IEditableCollectionView, IPagedCollectionView {
        public _src: any[];
        public _ncc: INotifyCollectionChanged;
        public _view: any[];
        public _pgView: any[];
        public _groups: CollectionViewGroup[];
        public _idx: number;
        public _filter: IPredicate;
        public _srtDesc: ObservableArray;
        public _grpDesc: ObservableArray;
        public _newItem: any;
        public _edtItem: any;
        public _edtClone: any;
        public _pgSz: number;
        public _pgIdx: number;
        public _updating: number;
        public _itemCreator: Function;
        public _trackChanges: boolean;
        public _chgAdded: ObservableArray;
        public _chgRemoved: ObservableArray;
        public _chgEdited: ObservableArray;
        /**
        * Initializes a new instance of a @see:CollectionView.
        *
        * @param sourceCollection Array that serves as a source for this
        * @see:CollectionView.
        */
        constructor(sourceCollection?: any);
        /**
        * Gets or sets a function that creates new items for the collection.
        *
        * If the creator function is not supplied, the @see:CollectionView
        * will try to create an uninitilized item of the appropriate type.
        *
        * If the creator function is supplied, it should be a function that
        * takes no parameters and returns an initialized object of the proper
        * type for the collection.
        */
        public newItemCreator : Function;
        /**
        * Returns true if the caller queries for a supported interface.
        *
        * @param interfaceName Name of the interface to look for.
        * @return True if the caller queries for a supported interface.
        */
        public implementsInterface(interfaceName: string): boolean;
        /**
        * Gets or sets a value that determines whether the control should
        * track changes to the data.
        *
        * If @see:trackChanges is set to true, the @see:CollectionView keeps
        * track of changes to the data and exposes them through the
        * @see:itemsAdded, @see:itemsRemoved, and @see:itemsEdited collections.
        *
        * Tracking changes is useful in situations where you need to to update
        * the server after the user has confirmed that the modifications are
        * valid.
        *
        * After committing or cancelling changes, use the @see:clearChanges method
        * to clear the @see:itemsAdded, @see:itemsRemoved, and @see:itemsEdited
        * collections.
        *
        * The @see:CollectionView only tracks changes made when the proper
        * @see:CollectionView methods are used (@see:beginEdit/@see:commitEdit,
        * @see:addNew/@see:commitNew, and @see:remove).
        * Changes made directly to the data are not tracked.
        */
        public trackChanges : boolean;
        /**
        * Gets an @see:ObservableArray containing the records that were added to
        * the collection since @see:changeTracking was enabled.
        */
        public itemsAdded : ObservableArray;
        /**
        * Gets an @see:ObservableArray containing the records that were removed from
        * the collection since @see:changeTracking was enabled.
        */
        public itemsRemoved : ObservableArray;
        /**
        * Gets an @see:ObservableArray containing the records that were edited in
        * the collection since @see:changeTracking was enabled.
        */
        public itemsEdited : ObservableArray;
        /**
        * Clears all changes by removing all items in the @see:itemsAdded,
        * @see:itemsRemoved, and @see:itemsEdited collections.
        *
        * Call this method after committing changes to the server or
        * after refreshing the data from the server.
        */
        public clearChanges(): void;
        /**
        * Occurs when the collection changes.
        */
        public collectionChanged: Event;
        /**
        * Raises the @see:collectionChanged event.
        *
        * @param e Contains a description of the change.
        */
        public onCollectionChanged(e?: NotifyCollectionChangedEventArgs): void;
        private _raiseCollectionChanged(action?, item?, index?);
        /**
        * Gets a value indicating whether this view supports filtering via the
        * @see:filter property.
        */
        public canFilter : boolean;
        /**
        * Gets a value indicating whether this view supports grouping via the
        * @see:groupDescriptions property.
        */
        public canGroup : boolean;
        /**
        * Gets a value indicating whether this view supports sorting via the
        * @see:sortDescriptions property.
        */
        public canSort : boolean;
        /**
        * Gets the current item in the view.
        */
        public currentItem : any;
        /**
        * Gets the ordinal position of the current item in the view.
        */
        public currentPosition : number;
        /**
        * Gets or sets a callback used to determine if an item is suitable for
        * inclusion in the view.
        *
        * The callback function should return true if the item passed in as a
        * parameter should be included in the view.
        *
        * NOTE: If the filter function needs a scope (i.e. a meaningful 'this'
        * value) remember to set the filter using the 'bind' function to  specify
        * the 'this' object. For example:
        * <pre>
        *   collectionView.filter = this._filter.bind(this);
        * </pre>
        */
        public filter : IPredicate;
        /**
        * Gets a collection of @see:GroupDescription objects that describe how the
        * items in the collection are grouped in the view.
        */
        public groupDescriptions : ObservableArray;
        /**
        * Gets an array of @see:CollectionViewGroup objects that represents the
        * top-level groups.
        */
        public groups : CollectionViewGroup[];
        /**
        * Gets a value indicating whether this view contains no items.
        */
        public isEmpty : boolean;
        /**
        * Gets a collection of @see:SortDescription objects that describe how the items
        * in the collection are sorted in the view.
        */
        public sortDescriptions : ObservableArray;
        /**
        * Gets or sets the underlying (unfiltered and unsorted) collection.
        */
        public sourceCollection : any;
        private _sourceChanged(s, e);
        /**
        * Returns a value indicating whether a given item belongs to this view.
        *
        * @param item Item to seek.
        */
        public contains(item: any): boolean;
        /**
        * Sets the specified item to be the current item in the view.
        *
        * @param item Item that will become current.
        */
        public moveCurrentTo(item: any): boolean;
        /**
        * Sets the first item in the view as the current item.
        */
        public moveCurrentToFirst(): boolean;
        /**
        * Sets the last item in the view as the current item.
        */
        public moveCurrentToLast(): boolean;
        /**
        * Sets the item after the current item in the view as the current item.
        */
        public moveCurrentToNext(): boolean;
        /**
        * Sets the item at the specified index in the view as the current item.
        *
        * @param index Index of the item that will become current.
        */
        public moveCurrentToPosition(index: number): boolean;
        /**
        * Sets the item before the current item in the view as the current item.
        */
        public moveCurrentToPrevious(): boolean;
        /**
        * Re-creates the view using the current sort, filter, and group parameters.
        */
        public refresh(): void;
        private _compareItems();
        /**
        * Occurs after the current item changes.
        */
        public currentChanged: Event;
        /**
        * Raises the @see:currentChanged event.
        */
        public onCurrentChanged(e?: EventArgs): void;
        /**
        * Occurs before the current item changes.
        */
        public currentChanging: Event;
        /**
        * Raises the @see:currentChanging event.
        *
        * @param e @see:CancelEventArgs that contains the event data.
        */
        public onCurrentChanging(e: CancelEventArgs): boolean;
        /**
        * Gets items in the view.
        */
        public items : any[];
        /**
        * Suspend refreshes until the next call to @see:endUpdate.
        */
        public beginUpdate(): void;
        /**
        * Resume refreshes suspended by a call to @see:beginUpdate.
        */
        public endUpdate(): void;
        /**
        * Gets a value that indicates whether notifications are currently suspended
        * (see @see:beginUpdate and @see:endUpdate).
        */
        public isUpdating : boolean;
        /**
        * Executes a function within a @see:beginUpdate/@see:endUpdate block.
        *
        * The collection will not be refreshed until the function finishes.
        * This method ensures @see:endUpdate is called even if the function throws.
        *
        * @param fn Function to be executed without updates.
        */
        public deferUpdate(fn: Function): void;
        /**
        * Gets a value indicating whether a new item can be added to the collection.
        */
        public canAddNew : boolean;
        /**
        * Gets a value indicating whether the collection view can discard pending changes
        * and restore the original values of an edited object.
        */
        public canCancelEdit : boolean;
        /**
        * Gets a value indicating whether items can be removed from the collection.
        */
        public canRemove : boolean;
        /**
        * Gets the item that is being added during the current add transaction.
        */
        public currentAddItem : any;
        /**
        * Gets the item that is being edited during the current edit transaction.
        */
        public currentEditItem : any;
        /**
        * Gets a value indicating whether an add transaction is in progress.
        */
        public isAddingNew : boolean;
        /**
        * Gets a value indicating whether an edit transaction is in progress.
        */
        public isEditingItem : boolean;
        /**
        * Adds a new item to the collection.
        *
        * @return The new item that was added to the collection.
        */
        public addNew(): any;
        /**
        * Ends the current edit transaction and, if possible,
        * restores the original value to the item.
        */
        public cancelEdit(): void;
        /**
        * Ends the current add transaction and discards the pending new item.
        */
        public cancelNew(): void;
        /**
        * Ends the current edit transaction and saves the pending changes.
        */
        public commitEdit(): void;
        /**
        * Ends the current add transaction and saves the pending new item.
        */
        public commitNew(): void;
        /**
        * Begins an edit transaction of the specified item.
        *
        * @param item Item to be edited.
        */
        public editItem(item: any): void;
        /**
        * Removes the specified item from the collection.
        *
        * @param item Item to be removed from the collection.
        */
        public remove(item: any): void;
        /**
        * Removes the item at the specified index from the collection.
        *
        * @param index Index of the item to be removed from the collection.
        * The index is relative to the view, not to the source collection.
        */
        public removeAt(index: number): void;
        public _copy(dst: any, src: any): void;
        public _sameContent(dst: any, src: any): boolean;
        /**
        * Gets a value indicating whether the @see:pageIndex value can change.
        */
        public canChangePage : boolean;
        /**
        * Gets a value indicating whether the index is changing.
        */
        public isPageChanging : boolean;
        /**
        * Gets the number of known items in the view before paging is applied.
        */
        public itemCount : number;
        /**
        * Gets the zero-based index of the current page.
        */
        public pageIndex : number;
        /**
        * Gets or sets the number of items to display on a page.
        */
        public pageSize : number;
        /**
        * Gets the total number of items in the view before paging is applied.
        */
        public totalItemCount : number;
        /**
        * Gets the total number pages.
        */
        public pageCount : number;
        /**
        * Sets the first page as the current page.
        *
        * @return True if the page index was changed successfully.
        */
        public moveToFirstPage(): boolean;
        /**
        * Sets the last page as the current page.
        *
        * @return True if the page index was changed successfully.
        */
        public moveToLastPage(): boolean;
        /**
        * Moves to the page after the current page.
        *
        * @return True if the page index was changed successfully.
        */
        public moveToNextPage(): boolean;
        /**
        * Moves to the page at the specified index.
        *
        * @param index Index of the page to move to.
        * @return True if the page index was changed successfully.
        */
        public moveToPage(index: number): boolean;
        /**
        * Moves to the page before the current page.
        *
        * @return True if the page index was changed successfully.
        */
        public moveToPreviousPage(): boolean;
        /**
        * Occurs after the page index changes.
        */
        public pageChanged: Event;
        /**
        * Raises the @see:pageChanged event.
        */
        public onPageChanged(e?: EventArgs): void;
        /**
        * Occurs before the page index changes.
        */
        public pageChanging: Event;
        /**
        * Raises the @see:pageChanging event.
        *
        * @param e @see:PageChangingEventArgs that contains the event data.
        */
        public onPageChanging(e: PageChangingEventArgs): boolean;
        public _getPageView(): any[];
        public _createGroups(): CollectionViewGroup[];
        public _mergeGroupItems(groups: CollectionViewGroup[]): any[];
        public _getGroup(gd: GroupDescription, groups: CollectionViewGroup[], name: string, level: number, isBottomLevel: boolean): CollectionViewGroup;
    }
    /**
    * Represents a group created by a @see:CollectionView object based on
    * its @see:groupDescriptions property.
    */
    class CollectionViewGroup {
        public _gd: GroupDescription;
        public _name: string;
        public _level: number;
        public _isBottomLevel: boolean;
        public _groups: CollectionViewGroup[];
        public _items: any[];
        public _agg: {};
        /**
        * Initializes a new instance of a @see:CollectionViewGroup.
        *
        * @param groupDescription @see:GroupDescription that owns the new group.
        * @param name Name of the new group.
        * @param level Level of the new group.
        * @param isBottomLevel Whether this group has any subgroups.
        */
        constructor(groupDescription: GroupDescription, name: string, level: number, isBottomLevel: boolean);
        public name : string;
        public level : number;
        public isBottomLevel : boolean;
        public items : any[];
        public groups : CollectionViewGroup[];
        public groupDescription : GroupDescription;
        /**
        * Calculates an aggregate value for the items in this group.
        *
        * @param aggType Type of aggregate to calculate.
        * @param binding Property to aggregate on.
        * @return The aggregate value.
        */
        public getAggregate(aggType: Aggregate, binding: string): any;
    }
}

declare module wijmo {
    /**
    * Provides a pop-up window that displays additional information about elements on the page.
    *
    * The @see:Tooltip class can be used in two modes:
    *
    * <b>Automatic Mode:</b> Use the @see:setTooltip method to connect the @see:Tooltip to
    * one or more elements on the page. The @see:Tooltip will automatically monitor events
    * and display the tooltips when the user performs actions that trigger the tooltip.
    * For example:
    *
    * <pre>var tt = new wijmo.Tooltip();
    * tt.setTooltip('#menu', 'Select commands.');
    * tt.setTooltip('#tree', 'Explore the hierarchy.');
    * tt.setTooltip('#chart', '#idChartTooltip');</pre>
    *
    * <b>Manual Mode:</b> The caller is responsible for showing and hiding the tooltip
    * using the @see:show and @see:hide methods. For example:
    *
    * <pre>var tt = new wijmo.Tooltip();
    * element.addEventListener('click', function () {
    *   if (tt.isVisible) {
    *     tt.hide();
    *   } else {
    *     tt.show(element, 'This is an important element!');
    *   }
    * });</pre>
    */
    class Tooltip {
        private static _eTip;
        private _toShow;
        private _toHide;
        private _showAutoTipBnd;
        private _hideAutoTipBnd;
        private _html;
        private _gap;
        private _showDelay;
        private _hideDelay;
        private _tips;
        /**
        * Initializes a new instance of a @see:Tooltip object.
        */
        constructor();
        /**
        * Assigns tooltip content to a given element on the page.
        *
        * The same tooltip may be used to display information for any number
        * of elements on the page. To remove the tooltip from an element,
        * call @see:setTooltip and specify null for the content.
        *
        * @param element Element, element ID, or control that the tooltip explains.
        * @param content Tooltip content or ID of the element that contains the tooltip content.
        */
        public setTooltip(element: any, content: string): void;
        /**
        * Shows the tooltip with the specified content, next to the specified element.
        *
        * @param element Element, element ID, or control that the tooltip explains.
        * @param content Tooltip content or ID of the element that contains the tooltip content.
        * @param bounds Optional element that defines the bounds of the area that the tooltip
        * targets. If not provided, the bounds of the element are used (as reported by the
        * <b>getBoundingClientRect</b> method).
        */
        public show(element: any, content: string, bounds?: Rect): void;
        /**
        * Hides the tooltip if it is currently visible.
        */
        public hide(): void;
        /**
        * Gets whether the tooltip is currently visible.
        */
        public isVisible : boolean;
        /**
        * Gets or sets whether the tooltip contents should be displayed as plain text or as HTML.
        */
        public isContentHtml : boolean;
        /**
        * Gets or sets the distance between the tooltip and the target element.
        */
        public gap : number;
        /**
        * Gets or sets the delay, in milliseconds, before showing the tooltip after the
        * mouse enters the target element.
        */
        public showDelay : number;
        /**
        * Gets or sets the delay, in milliseconds, before hiding the tooltip after the
        * mouse leaves the target element.
        */
        public hideDelay : number;
        /**
        * Occurs before the tooltip content is displayed.
        *
        * The event handler may customize the tooltip content or suppress the
        * tooltip display by changing the event parameters.
        */
        public popup: Event;
        /**
        * Raises the @see:popup event.
        *
        * @param e @see:TooltipEventArgs that contains the event data.
        */
        public onPopup(e: TooltipEventArgs): void;
        private _indexOf(e);
        private _attach(e);
        private _detach(e);
        private _showAutoTip(evt);
        private _hideAutoTip();
        private _clearTimeouts();
        private _getElement(e);
        private _getOuterSize(e);
        private _getContent(content);
        private _setContent(content);
    }
    /**
    * Provides arguments for the @see:popup event.
    */
    class TooltipEventArgs extends CancelEventArgs {
        private _content;
        /**
        * Initializes a new instance of a @see:TooltipEventArgs.
        *
        * @param content String to show in the tooltip.
        */
        constructor(content: string);
        /**
        * Gets or sets the content to show in the tooltip.
        *
        * This parameter can be used while handling the @see:popup event to modify the content
        * of the tooltip.
        */
        public content : string;
    }
}

