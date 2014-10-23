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
* Defines the @see:FlexChart control and associated classes.
*
* The example below creates a @see:FlexChart control and binds it to a 'data' array.
* The chart has three series, each corresponding to a property in the objects
* contained in the source array. The last series in the example uses the
* @see:chartType property to override the default chart type used by the
* other series.
*
* @fiddle:6GB66
*/
declare module wijmo.chart {
    /**
    * Specifies the chart type.
    */
    enum ChartType {
        /** Column chart  */
        Column = 0,
        /** Bar chart  */
        Bar = 1,
        /** Scatter chart  */
        Scatter = 2,
        /** Line chart  */
        Line = 3,
        /** Line and symbol chart  */
        LineSymbols = 4,
        /** Area chart  */
        Area = 5,
        /** Bubble chart  */
        Bubble = 6,
        /** Candlestick chart  */
        Candlestick = 7,
        /** Hi-low-open-close chart  */
        HighLowOpenClose = 8,
    }
    /**
    * Specifies the chart's stacking mode.
    */
    enum Stacking {
        /** No stacking */
        None = 0,
        /** Stacked data */
        Stacked = 1,
        /** 100% Stacked data */
        Stacked100pc = 2,
    }
    /**
    * Specifies the chart's selection mode.
    */
    enum SelectionMode {
        /** Do not select series or data points when the user clicks the chart. */
        None = 0,
        /** Select the whole @see:Series when the user clicks it on the chart. */
        Series = 1,
        /** Select the @see:Series and the data point when the user clicks it on the chart. */
        Point = 2,
    }
    /**
    * The @see:FlexChart control provides a powerful and flexible way to visualize
    * data.
    *
    * You can use the @see:FlexChart control to create charts that display data in
    * several formats, including bar, line, symbol, bubble, and others.
    *
    * To use the @see:FlexChart control, set the @see:itemsSource property to an
    * array containing the data, then add one or more @see:Series objects
    * to the @see:series property.
    *
    * Use the @see:chartType property to define the chart type used for all series.
    * You may override the chart type for specific series by setting the @see:chartType
    * property on each @see:Series object.
    */
    class FlexChart extends Control implements _IPalette {
        static _CSS_AXIS_X: string;
        static _CSS_AXIS_Y: string;
        static _CSS_LINE: string;
        static _CSS_GRIDLINE: string;
        static _CSS_TICK: string;
        static _CSS_LABEL: string;
        static _CSS_LEGEND: string;
        static _CSS_HEADER: string;
        static _CSS_FOOTER: string;
        static _CSS_TITLE: string;
        static _CSS_SELECTION: string;
        static _CSS_PLOT_AREA: string;
        private static _WIDTH;
        private static _HEIGHT;
        private static _SELECTION_THRESHOLD;
        private _items;
        private _cv;
        private _series;
        private _axisX;
        private _axisY;
        private _chartType;
        private _currentRenderEngine;
        private _selectionMode;
        private _selection;
        private _selectionIndex;
        private _interpolateNulls;
        private _legendToggle;
        private _symbolSize;
        private _dataInfo;
        public _plotRect: Rect;
        private __barPlotter;
        private __linePlotter;
        private __areaPlotter;
        private __bubblePlotter;
        private __financePlotter;
        private _legend;
        private _header;
        private _headerStyle;
        private _footer;
        private _footerStyle;
        private _binding;
        private _bindingX;
        private _rotated;
        private _stacking;
        public _xlabels: string[];
        public _xvals: number[];
        public _xDataType: DataType;
        private _palette;
        private _defPalette;
        private _options;
        private _hitTester;
        private _rectFooter;
        private _rectHeader;
        private _rectLegend;
        private _rectChart;
        private _tooltip;
        private _keywords;
        private _notifyCurrentChanged;
        private _legendHost;
        private _plotMargin;
        private _itemFormatter;
        /**
        * Initializes a new instance of a @see:FlexChart control.
        *
        * @param element The DOM element that will host the control, or a jQuery selector (e.g. '#theCtrl').
        * @param options Javascript object containing initialization data for the control.
        */
        constructor(element: any, options?: any);
        /**
        * Gets the collection of series.
        */
        public series : collections.ObservableArray;
        /**
        * Gets or sets the array or @see:ICollectionView that contains the data used to create the chart.
        */
        public itemsSource : any;
        /**
        * Gets the @see:ICollectionView that contains the chart data.
        */
        public collectionView : collections.ICollectionView;
        /**
        * Gets or sets the chart type.
        */
        public chartType : ChartType;
        /**
        * Gets the main x-axis.
        */
        public axisX : Axis;
        /**
        * Gets the main y-axis.
        */
        public axisY : Axis;
        /**
        * Gets the main y-axis.
        */
        public legend : Legend;
        /**
        * Gets or sets the name of the property that contains the Y values.
        */
        public binding : string;
        /**
        * Gets or sets the name of the property that contains the X values.
        */
        public bindingX : string;
        /**
        * Gets or sets whether series should be stacked or plotted independently.
        */
        public stacking : Stacking;
        /**
        * Gets or sets the size of the symbols used to render this @see:FlexChart.
        *
        * This property may be overridden by the @see:Series.
        */
        public symbolSize : number;
        /**
        * Gets or sets whether to interpolate null values in the data.
        *
        * If true, the chart will interpolate the value of any missing data
        * based on neighboring points. If false, it will leave a break in
        * lines and areas at the points with null values.
        */
        public interpolateNulls : boolean;
        /**
        * Gets or sets whether clicking legend items should toggle the
        * series visibility.
        */
        public legendToggle : boolean;
        /**
        * Gets or sets the chart header.
        */
        public header : string;
        /**
        * Gets or sets the text displayed in the chart footer.
        */
        public footer : string;
        /**
        * Gets or sets the style of chart header.
        */
        public headerStyle : any;
        /**
        * Gets or sets the style of chart footer.
        */
        public footerStyle : any;
        /**
        * Gets or sets whether to flip the axes so X is vertical and Y horizontal.
        */
        public rotated : boolean;
        /**
        * Gets or sets an array with default colors used for displaying each series.
        */
        public palette : string[];
        /**
        * Gets or sets various chart options.
        *
        * The following options are supported:
        *
        * <b>bubble.minSize, bubble.maxSize</b>: specifies minimum and maximum pixel sizes
        * of symbols in Bubble chart. The default values are 5 and 30.
        *
        * <pre>
        * chart.options = {
        *   bubble: { minSize: 5, maxSize: 30 }
        * }
        * </pre>
        */
        public options : any;
        /**
        * Gets the chart @see:Tooltip.
        *
        * The tooltip content is generated using a template that may contain the following
        * parameters:
        *
        * <ul>
        *  <li><b>seriesName</b>: The name of the series that contains the chart element.</li>
        *  <li><b>pointIndex</b>: The index of the chart element within the series.</li>
        *  <li><b>x</b>: The <b>x</b> value of the chart element.</li>
        *  <li><b>y</b>: The <b>y</b> value of the chart element.</li>
        * </ul>
        *
        * To modify the template, assign the new value to the tooltip's content property.
        * For example:
        * <pre>
        * chart.tooltip.content = '&lt;b&gt;{seriesName}&lt;/b&gt; &lt;img src="resources/{x}.png"/&gt;&lt;br/&gt;{y}';
        * </pre>
        *
        * You can disable the chart tooltips by setting the template to an empty string, or
        * set the content to a function that takes a @see:HitTestInfo as a parameter.
        *
        * You can also use the @see:tooltip property to customize tooltip parameters such
        * as @see:showDelay and @see:hideDelay:
        * <pre>
        * chart.tooltip.showDelay = 1000;
        * </pre>
        */
        public tooltip : ChartTooltip;
        /**
        * Gets or sets the chart selection mode.
        */
        public selectionMode : SelectionMode;
        /**
        * Gets or sets the chart selection.
        */
        public selection : Series;
        /**
        * Gets or sets the plot margin.
        */
        public plotMargin : any;
        /**
        * Gets or sets the item formatter function.
        */
        public itemFormatter : Function;
        /**
        * Occurs after the selection changed.
        */
        public selectionChanged: Event;
        /**
        * Raises the @see:rendered event.
        */
        public onSelectionChanged(e?: EventArgs): void;
        /**
        * Occurs after chart finishes rendering.
        */
        public rendered: Event;
        /**
        * Raises the @see:rendered event.
        */
        public onRendered(): void;
        /**
        * Occurs when series visibility changed.
        */
        public seriesVisibilityChanged: Event;
        /**
        * Raises the @see:seriesVisibilityChanged event.
        *
        * @param e @see:SeriesEventArgs that contains the event data.
        */
        public onSeriesVisibilityChanged(e: SeriesEventArgs): void;
        /**
        * Refreshes the chart.
        *
        * @param fullUpdate Whether to update the control layout as well as the content.
        */
        public refresh(fullUpdate?: boolean): void;
        /**
        * Gets a @see:HitTestInfo object with information about a given point.
        *
        * @param pt Point to investigate, in window coordinates.
        * @param y Y coordinate of the point (if the first parameter is a number).
        * @return HitTestInfo object with information about the point.
        */
        public hitTest(pt: any, y?: number): HitTestInfo;
        /**
        * Converts point from control coordinates to chart data coordinates.
        *
        * @param pt Point in control coordinates.
        * @param y Y coordinate of the point (if the first parameter is a number).
        * @return The point in data coordinates.
        */
        public pointToData(pt: any, y?: number): Point;
        /**
        * Converts point from data coordinates to page coordinates.
        *
        * @param pt Point in data coordinates.
        * @param y Y coordinate of the point (if the first parameter is a number).
        * @return The point in page coordinates.
        */
        public dataToPoint(pt: any, y?: number): Point;
        public _copy(key: string, value: any): boolean;
        private _clearSeries();
        private _cvCollectionChanged(sender, e);
        private _cvCurrentChanged(sender, e);
        private _bindChart();
        private _toControl(pt, y?);
        /**
        * Gets color from palette by index.
        *
        * @param index of color in palette.
        */
        public _getColor(index: number): string;
        /**
        * Gets lighter color from palette by index.
        *
        * @param index of color in palette.
        */
        public _getColorLight(index: number): string;
        public _hitTestSeries(pt: Point, seriesIndex: number): HitTestInfo;
        public _hitTestData(pt: any): HitTestInfo;
        private _hitTestLines(hti);
        private static _dist2(p1, p2);
        static _dist(p0: Point, p1: Point, p2: Point): number;
        static _distToSegmentSquared(p: Point, v: Point, w: Point): number;
        private _isRotated();
        private _refreshChart();
        private _drawTitle(engine, rect, title, style, isFooter);
        public _plotrectId: string;
        private _render(engine);
        private _getAxes();
        private _clearPlotters();
        private _initPlotter(plotter);
        private _barPlotter;
        private _linePlotter;
        private _areaPlotter;
        private _bubblePlotter;
        private _financePlotter;
        private _getPlotter(series);
        private _layout(rect, size, engine);
        private _getTooltipContent(ht);
        private _select(newSelection, pointIndex);
        private _highlightCurrent();
        private _highlight(series, selected, pointIndex);
        private _highlightItems(items, cls, selected);
        private _parseMargin(value);
        static _contains(rect: Rect, pt: Point): boolean;
        static _toOADate(date: Date): number;
        static _fromOADate(val: number): Date;
        static _renderText(engine: IRenderEngine, text: string, pos: Point, halign: any, valign: any, className?: string, groupName?: string): void;
        static _renderRotatedText(engine: IRenderEngine, text: string, pos: Point, halign: any, valign: any, center: Point, angle: number, className: string): void;
    }
    /**
    * Represents chart palette.
    */
    interface _IPalette {
        _getColor(i: number): string;
        _getColorLight(i: number): string;
    }
    /**
    * Extends the @see:Tooltip class to provide chart tooltips.
    */
    class ChartTooltip extends Tooltip {
        private _content;
        private _threshold;
        /**
        * Initializes a new instance of a @see:ChartTooltip.
        */
        constructor();
        /**
        * Gets or sets the tooltip content.
        */
        public content : any;
        /**
        * Gets or sets the maximum distance from element at which tooltip is displayed.
        */
        public threshold : number;
    }
}

declare module wijmo.chart {
    /**
    * Identifies the position of an axis or legend on the chart.
    */
    enum Position {
        /** The item is not visible. */
        None = 0,
        /** The item appears on the left of the chart. */
        Left = 1,
        /** The item appears above the chart. */
        Top = 2,
        /** The item appears on the right of the chart. */
        Right = 3,
        /** The item appears below the chart. */
        Bottom = 4,
    }
    /**
    * Identifies the axis type.
    */
    enum AxisType {
        /** Category axis (normally horizontal) */
        X = 0,
        /** Value axis (normally vertical) */
        Y = 1,
    }
    /**
    * Axis interface.
    */
    interface _IAxis {
        actualMin: number;
        actualMax: number;
        convert(val: number): number;
    }
    /**
    * Identifies the appearance of axis tick marks.
    */
    enum TickMark {
        /** No tick mark */
        None = 0,
        /** Tick mark is outside plot area */
        Outside = 1,
        /** Tick mark is inside plot area */
        Inside = 2,
        /** Tick mark crosses axis */
        Cross = 3,
    }
    /**
    * Represents an axis in the chart.
    */
    class Axis implements _IAxis {
        private _GRIDLINE_WIDTH;
        private _LINE_WIDTH;
        private _TICK_WIDTH;
        private _TICK_HEIGHT;
        private _TICK_OVERLAP;
        private _TICK_LABEL_DISTANCE;
        private _chart;
        private _type;
        private _min;
        private _max;
        private _position;
        private _majorUnit;
        private _minorUnit;
        private _majorGrid;
        private _title;
        private _labelStyle;
        private _reversed;
        private _format;
        private _actualMin;
        private _actualMax;
        private _axisType;
        private _majorTickMarks;
        private _logBase;
        private _labels;
        private _axisLine;
        private _plotrect;
        private _szTitle;
        private _isTimeAxis;
        private _fgColor;
        private _lbls;
        private _values;
        public _axrect: Rect;
        public _desiredSize: Size;
        public _annoSize: Size;
        /**
        * Initializes a new instance of an @see:Axis.
        *
        * @param position Position of the axis on the chart.
        */
        constructor(position: Position);
        /**
        * Gets the actual axis minimum.
        */
        public actualMin : number;
        /**
        * Gets the actual axis maximum.
        */
        public actualMax : number;
        /**
        * Gets or sets the minimum value shown on the axis. If not set, the minimum is calculated automatically.
        */
        public min : number;
        /**
        * Gets or sets the maximum value shown on the axis. If not set, the maximum is calculated automatically.
        */
        public max : number;
        /**
        * Gets or sets whether the axis is reversed (top to bottom/right to left).
        */
        public reversed : boolean;
        /**
        * Gets or sets the axis position.
        */
        public position : Position;
        /**
        * Gets or sets the distance between axis labels.
        */
        public majorUnit : number;
        /**
        * Gets or sets the text shown next to the axis.
        */
        public title : string;
        /**
        * Gets or sets the format string used for the axis labels (see @see:wijmo.Globalize).
        */
        public format : string;
        /**
        * Gets or sets whether the axis should include grid lines.
        */
        public majorGrid : boolean;
        /**
        * Gets or sets the appearance of axis tick marks.
        */
        public majorTickMarks : TickMark;
        /**
        * Gets or sets whether the axis line is visible.
        */
        public axisLine : boolean;
        /**
        * Gets or sets whether the axis labels are visible.
        */
        public labels : boolean;
        /**
        * Calculates axis height.
        *
        * @param engine Rendering engine.
        */
        public _getHeight(engine: IRenderEngine): number;
        /**
        * Update actual axis limits based on specifies data range.
        *
        * @param dataType Data type.
        * @param dataMin Data minimum.
        * @param dataMax Data maximum.
        * @param labels Category labels(category axis).
        * @param values Values(value axis).
        */
        public _updateActualLimits(dataType: DataType, dataMin: number, dataMax: number, labels?: string[], values?: number[]): void;
        /**
        * Set axis position.
        *
        * @param axisRect Axis rectangle.
        * @param plotRect Plot area rectangle.
        */
        public _layout(axisRect: Rect, plotRect: Rect): void;
        /**
        * Render the axis.
        *
        * @param engine Rendering engine.
        */
        public _render(engine: IRenderEngine): void;
        /**
        * Converts value from data to pixel coordinate.
        *
        * @param val Data value.
        */
        public convert(val: number): number;
        /**
        * Converts value from pixel to data coordinate.
        *
        * @param val Pixel coordinate.
        */
        public convertBack(val: number): number;
        /**
        * Gets the axis type.
        */
        public axisType : AxisType;
        private _invalidate();
        private _createLabels(start, len, delta, vals, lbls);
        private _createTimeLabels(start, len, vals, lbls);
        public _formatValue(val: number): string;
        private _calcMajorUnit();
        private _getAnnoNumber(isVert);
        private _nicePrecision(range);
        private _niceTickNumber(x);
        private _niceNumber(x, exp, round);
    }
}

declare module wijmo.chart {
    /**
    * Specifies Series visibility.
    */
    enum SeriesVisibility {
        /** Series visible on plot and in legend. */
        Visible = 0,
        /** Visible only on plot. */
        Plot = 1,
        /** Visible only in legend. */
        Legend = 2,
        /** Hidden. */
        Hidden = 3,
    }
    /**
    * Specifies marker appearance.
    */
    enum Marker {
        /**
        * Dot marker.
        */
        Dot = 0,
        /**
        * Box marker.
        */
        Box = 1,
    }
    /**
    * Data series interface
    */
    interface _ISeries {
        style: any;
        symbolStyle: any;
        getValues: (dim: number) => number[];
        getDataType: (dim: number) => DataType;
        chartType: ChartType;
        drawLegendItem(engine: IRenderEngine, rect: Rect): any;
        measureLegendItem(engine: IRenderEngine): Size;
        _setPointIndex(pointIndex: number, elementIndex: number): any;
    }
    /**
    * Provides arguments for @see:Series events.
    */
    class SeriesEventArgs extends EventArgs {
        public _series: Series;
        /**
        * Initializes a new instance of a @see:SeriesEventArgs.
        *
        * @param series @see:Series affected by this event.
        */
        constructor(series: Series);
        /**
        * Gets the @see:Series affected by this event.
        */
        public series : Series;
    }
    /**
    * Represents a series in the chart.
    *
    * The @see:Series class supports all basic chart types. You may define
    * additional chart types by creating classes that derive from @see:Series
    * and override the @see:renderSeries method.
    */
    class Series implements _ISeries {
        private static _LEGEND_ITEM_WIDTH;
        private static _LEGEND_ITEM_HEIGHT;
        private static _LEGEND_ITEM_MARGIN;
        private static _DEFAULT_SYM_SIZE;
        private _chart;
        private _name;
        private _binding;
        private _showValues;
        private _symbolStyle;
        private _symbolSize;
        private _style;
        private _cv;
        private _itemsSource;
        private _values;
        private _valueDataType;
        private _chartType;
        private _symbolMarker;
        private _bindingX;
        private _xvalues;
        private _xvalueDataType;
        private _cssClass;
        private _visibility;
        public _legendElement: SVGAElement;
        public _hostElement: SVGGElement;
        public _pointIndexes: number[];
        constructor();
        /**
        * Gets or sets the series style.
        */
        public style : any;
        /**
        * Gets or sets the series symbol style.
        */
        public symbolStyle : any;
        /**
        * Gets or sets the size of the symbols used to render this @see:Series.
        */
        public symbolSize : number;
        public _getSymbolSize(): number;
        /**
        * Gets or sets the series marker.
        */
        public symbolMarker : Marker;
        /**
        * Gets or sets the series chart type.
        */
        public chartType : ChartType;
        /**
        * Gets or sets the name of the property that contains the Y values.
        */
        public binding : string;
        /**
        * Gets or sets the name of the property that contains the X values.
        */
        public bindingX : string;
        /**
        * Gets or sets the series name.
        *
        * The series name is displayed in the chart legend. Series without names
        * do not appear in the legend.
        */
        public name : string;
        /**
        * Gets or sets the series chart type.
        */
        public itemsSource : any;
        /**
        * Gets the @see:ICollectionView that contains the data for this series.
        */
        public collectionView : collections.ICollectionView;
        /**
        * Gets the @see:FlexChart that owns this series.
        */
        public chart : FlexChart;
        /**
        * Gets the series host element.
        */
        public hostElement : SVGGElement;
        /**
        * Gets the series element in legend.
        */
        public legendElement : SVGGElement;
        /**
        * Gets or sets the series CSS class.
        */
        public cssClass : string;
        /**
        * Gets or sets the series visibility.
        */
        public visibility : SeriesVisibility;
        /**
        * Gets a @see:HitTestInfo object with information about a given point.
        *
        * @param pt Point to investigate, in window coordinates.
        * @param y Y coordinate of the point (if the first parameter is a number).
        * @return HitTestInfo object with information about the point.
        */
        public hitTest(pt: any, y?: number): HitTestInfo;
        /**
        * Gets plot element that corresponds to the specified point index.
        *
        * @param pointIndex Index of data point.
        */
        public getPlotElement(pointIndex: number): any;
        public getDataType(dim: number): DataType;
        public getValues(dim: number): number[];
        /**
        * Draw legend item at the specified position.
        *
        * @param engine Rendering engine.
        * @param rect Position of legend item.
        */
        public drawLegendItem(engine: IRenderEngine, rect: Rect): void;
        /**
        * Measures legend item size.
        *
        * @param engine Rendering engine.
        */
        public measureLegendItem(engine: IRenderEngine): Size;
        /**
        * Clears cashed data values.
        */
        public _clearValues(): void;
        public _getBinding(index: number): string;
        public _getBindingValues(index: number): number[];
        public _getItem(pointIndex: number): any;
        public _getLength(): number;
        public _setPointIndex(pointIndex: number, elementIndex: number): void;
        private _cvCollectionChanged(sender, e);
        private _cvCurrentChanged(sender, e);
        private _bindValues(items, binding);
        private _invalidate();
        public _indexToPoint(pointIndex: number): Point;
    }
}

declare module wijmo.chart {
    /**
    * Represents rendering engine that performs basic drawing routines.
    */
    interface IRenderEngine {
        /**
        * Clear viewport and start render cycle.
        */
        beginRender(): any;
        /**
        * Finish render cycle.
        */
        endRender(): any;
        /**
        * Set viewport size.
        *
        * @param w Viewport width.
        * @param h Viewport height.
        */
        setViewportSize(w: number, h: number): any;
        /**
        * Gets or sets fill color.
        */
        fill: string;
        /**
        * Gets or sets stroke color.
        */
        stroke: string;
        /**
        * Gets or sets the stroke width.
        */
        strokeWidth: number;
        /**
        * Gets or sets the text color.
        */
        textFill: string;
        /**
        * Gets or sets the font size for text output.
        */
        fontSize: string;
        /**
        * Gets or sets the font family for text output.
        */
        fontFamily: string;
        drawEllipse(cx: number, cy: number, rx: number, ry: number, className?: string, style?: any): any;
        drawRect(x: number, y: number, w: number, h: number, className?: string, style?: any, clipPath?: string): any;
        drawLine(x1: number, y1: number, x2: number, y2: number, className?: string, style?: any): any;
        drawLines(xs: number[], ys: number[], className?: string, style?: any, clipPath?: string): any;
        drawPolygon(xs: number[], ys: number[], className?: string, style?: any, clipPath?: string): any;
        drawString(s: string, pt: Point, className?: string): any;
        drawStringRotated(label: string, pt: Point, center: Point, angle: number, className?: string): any;
        measureString(s: string, className?: string, groupName?: string): Size;
        startGroup(className?: string, clipPath?: string): any;
        endGroup(): any;
        addClipRect(clipRect: Rect, id: string): any;
    }
}

declare module wijmo.chart {
    /**
    * Render to svg.
    */
    class _SvgRenderEngine implements IRenderEngine {
        private static svgNS;
        private _element;
        private _svg;
        private _text;
        private _textGroup;
        private _defs;
        private _fill;
        private _stroke;
        private _textFill;
        private _strokeWidth;
        private _fontSize;
        private _fontFamily;
        private _group;
        private _clipRect;
        constructor(element: HTMLElement);
        public beginRender(): void;
        public endRender(): void;
        public setViewportSize(w: number, h: number): void;
        public fill : string;
        public fontSize : string;
        public fontFamily : string;
        public stroke : string;
        public strokeWidth : number;
        public textFill : string;
        public addClipRect(clipRect: Rect, id: string): void;
        public drawEllipse(cx: number, cy: number, rx: number, ry: number, className?: string, style?: any): void;
        public drawRect(x: number, y: number, w: number, h: number, className?: string, style?: any, clipPath?: string): void;
        public drawLine(x1: number, y1: number, x2: number, y2: number, className?: string, style?: any): void;
        public drawLines(xs: number[], ys: number[], className?: string, style?: any, clipPath?: string): void;
        public drawPolygon(xs: number[], ys: number[], className?: string, style?: any, clipPath?: string): void;
        public drawString(s: string, pt: Point, className?: string): void;
        public drawStringRotated(s: string, pt: Point, center: Point, angle: number, className?: string): void;
        public measureString(s: string, className?: string, groupName?: string): Size;
        public startGroup(className?: string, clipPath?: string): Element;
        public endGroup(): void;
        private _appendChild(element);
        private _create();
        private _setText(element, text);
        private _createText(pos, text);
        private _applyStyle(el, style);
        private _deCase(s);
    }
}

declare module wijmo.chart {
    /**
    * Represents chart legend.
    */
    class Legend {
        public _chart: FlexChart;
        public _position: Position;
        private _areas;
        private _sz;
        constructor(chart: FlexChart);
        /**
        * Gets or sets the legend position.
        */
        public position : Position;
        public _getDesiredSize(engine: IRenderEngine): Size;
        public _render(engine: IRenderEngine, pos: Point): void;
        public _hitTest(pt: Point): number;
    }
}

declare module wijmo.chart {
    /**
    * Chart elements enumeration.
    */
    enum ChartElement {
        /** The area inside axes. */
        PlotArea = 0,
        /** X-axis. */
        AxisX = 1,
        /** Y-axis. */
        AxisY = 2,
        /** The area outside axes. */
        ChartArea = 3,
        /** The chart legend. */
        Legend = 4,
        /** The chart header. */
        Header = 5,
        /** The chart footer. */
        Footer = 6,
        /** The chart series. */
        Series = 7,
        /** The chart series symbol. */
        SeriesSymbol = 8,
        /** No chart element. */
        None = 9,
    }
    /**
    * Contains information about a part of a @see:FlexChart control at
    * a specified page coordinate.
    */
    class HitTestInfo {
        private _chart;
        private _pt;
        public _series: Series;
        public _pointIndex: number;
        public _chartElement: ChartElement;
        public _dist: number;
        public _item: any;
        private _x;
        private __xfmt;
        private _y;
        private __yfmt;
        /**
        * Initializes a new instance of an @see:HitTestInfo.
        *
        * @param chart the chart control.
        * @param point the original point in window coordinates.
        */
        constructor(chart: FlexChart, point: Point);
        /**
        * Gets the point in control coordinates that this HitTestInfo refers to.
        */
        public point : Point;
        /**
        * Gets the chart series at the specified coordinates.
        */
        public series : Series;
        /**
        * Gets the data point index at the specified coordinates.
        */
        public pointIndex : number;
        /**
        * Gets the chart element at the specified coordinates.
        */
        public chartElement : ChartElement;
        /**
        * Gets the distance from the closest data point.
        */
        public distance : number;
        /**
        * Gets the data object that corresponds to the closest data point.
        */
        public item : any;
        /**
        * Gets the x-value of the closest data point.
        */
        public x : any;
        /**
        * Gets the y-value of the closest data point.
        */
        public y : any;
        public _xfmt : any;
        public _yfmt : any;
        private _getValue(index, formatted);
    }
}

