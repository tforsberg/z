﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Overview.aspx.cs" Inherits="Editor_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div>
		<asp:TextBox ID="TextBox1" runat="server" Width="760" Height="530" TextMode="MultiLine"> 
            <h1>
                JavaScript</h1>
            <p>
                <img src="http://cdn.wijmo.com/images/200px-JavaScript-logo.png" alt="JavaScript-logo.png" height="200" width="200" style="float: left; margin: 10px">
                JavaScript is a prototype-based scripting language that is dynamic, weakly typed and has first-class functions. It is a multi-paradigm language, supporting object-oriented, imperative, and functional programming styles. JavaScript was formalized in the ECMAScript language standard and is primarily used in the form of client-side JavaScript, implemented as part of a Web browser in order to provide enhanced user interfaces and dynamic websites. This enables programmatic access to computational objects within a host environment. JavaScript's use in applications outside Web pages - for example in PDF documents, site-specific browsers, and desktop widgets - is also significant. Newer and faster JavaScript VMs and frameworks built upon them (notably Node.js) have also increased the popularity of JavaScript for server-side web applications. JavaScript uses syntax influenced by that of C. JavaScript copies many names and naming conventions from Java, but the two languages are otherwise unrelated and have very different semantics. The key design principles within JavaScript are taken from the Self and Scheme programming languages.</p>
            <h2>
                History
            </h2>
            <p>
                JavaScript was originally developed by Brendan Eich of Netscape under the name Mocha, which was later renamed to LiveScript, and finally to JavaScript. LiveScript was the official name for the language when it first shipped in beta releases of Netscape Navigator 2.0 in September 1995, but it was renamed JavaScript in a joint announcement with Sun Microsystems on December 4, 1995, when it was deployed in the Netscape browser version 2.0B3.
            </p>
            <p>
                The change of name from LiveScript to JavaScript roughly coincided with Netscape adding support for Java technology in its Netscape Navigator web browser. The final choice of name caused confusion, giving the impression that the language was a spin-off of the Java programming language, and the choice has been characterized by many as a marketing ploy by Netscape to give JavaScript the cachet of what was then the hot new web-programming language. It has also been claimed that the language's name is the result of a co-marketing deal between Netscape and Sun, in exchange for Netscape bundling Sun's Java runtime with its then-dominant browser.
            </p>
            <p>
                JavaScript very quickly gained widespread success as a client-side scripting language for web pages. As a consequence, Microsoft named its implementation JScript to avoid trademark issues. JScript added new date methods to fix the Y2K-problematic methods in JavaScript, which were based on Java's java.util.Date class. JScript was included in Internet Explorer 3.0, released in August 1996.
            </p>
            <p>
                In November 1996, Netscape announced that it had submitted JavaScript to Ecma International for consideration as an industry standard, and subsequent work resulted in the standardized version named ECMAScript.
            </p>
            <p>
                JavaScript has become one of the most popular programming languages on the web. Initially, however, many professional programmers denigrated the language because its target audience was web authors and other such "amateurs", among other reasons. The advent of Ajax returned JavaScript to the spotlight and brought more professional programming attention. The result was a proliferation of comprehensive frameworks and libraries, improved JavaScript programming practices, and increased usage of JavaScript outside of web browsers, as seen by the proliferation of server-side JavaScript platforms.
            </p>
            <p>
                In January 2009, the CommonJS project was founded with the goal of specifying a common standard library mainly for JavaScript development outside the browser.
            </p>
            <h2>
                Versions</h2>
            <table style="text-align: center;">
                <tbody>
                    <tr>
                        <th>
                            Version
                        </th>
                        <th>
                            Release date
                        </th>
                        <th>
                            Equivalent to
                        </th>
                        <th>
                            Netscape Navigator
                        </th>
                        <th>
                            Mozilla Firefox
                        </th>
                        <th>
                            Internet Explorer
                        </th>
                        <th>
                            Opera
                        </th>
                        <th>
                            Safari
                        </th>
                        <th>
                            Google Chrome
                        </th>
                    </tr>
                    <tr>
                        <td>
                            1.0
                        </td>
                        <td>
                            March 1996
                        </td>
                        <td>
                        </td>
                        <td>
                            2.0
                        </td>
                        <td>
                        </td>
                        <td>
                            3.0
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.1
                        </td>
                        <td>
                            August 1996
                        </td>
                        <td>
                        </td>
                        <td>
                            3.0
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.2
                        </td>
                        <td>
                            June 1997
                        </td>
                        <td>
                        </td>
                        <td>
                            4.0-4.05
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.3
                        </td>
                        <td>
                            October 1998
                        </td>
                        <td>
                            ECMA-262 1st edition / ECMA-262 2nd edition
                        </td>
                        <td>
                            4.06-4.7x
                        </td>
                        <td>
                        </td>
                        <td>
                            4.0
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.4
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                            Netscape Server
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.5
                        </td>
                        <td>
                            November 2000
                        </td>
                        <td>
                            ECMA-262 3rd edition
                        </td>
                        <td>
                            6.0
                        </td>
                        <td>
                            1.0
                        </td>
                        <td>
                            5.5 (JScript 5.5), 6 (JScript 5.6), 7 (JScript 5.7), 8 (JScript 5.8)
                        </td>
                        <td>
                            6.0
                        </td>
                        <td>
                            3.0-5
                        </td>
                        <td>
                            1.0-10.0.666
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.6
                        </td>
                        <td>
                            November 2005
                        </td>
                        <td>
                            1.5 + Array extras + Array and String generics + <a class="mw-redirect" title="E4X" href="/wiki/E4X">E4X</a>
                        </td>
                        <td>
                        </td>
                        <td>
                            1.5
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.7
                        </td>
                        <td>
                            October 2006
                        </td>
                        <td>
                            1.6 + Pythonic generators + Iterators + let
                        </td>
                        <td>
                        </td>
                        <td>
                            2.0
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.8
                        </td>
                        <td>
                            June 2008
                        </td>
                        <td>
                            1.7 + <a class="mw-redirect" title="Generator (computer science)" href="/wiki/Generator_%28computer_science%29">Generator expressions</a> + <a title="Closure (computer science)" href="/wiki/Closure_%28computer_science%29">Expression closures</a>
                        </td>
                        <td>
                        </td>
                        <td>
                            3.0
                        </td>
                        <td>
                        </td>
                        <td>
                            11.50
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.8.1
                        </td>
                        <td>
                        </td>
                        <td>
                            1.8 + <a title="JSON" href="/wiki/JSON#Native_encoding_and_decoding_in_browsers">Native JSON</a> support + Minor Updates
                        </td>
                        <td>
                        </td>
                        <td>
                            3.5
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.8.2
                        </td>
                        <td>
                            June 22, 2009
                        </td>
                        <td>
                            1.8.1 + Minor updates
                        </td>
                        <td>
                        </td>
                        <td>
                            3.6
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1.8.5
                        </td>
                        <td>
                            July 27, 2010
                        </td>
                        <td>
                            1.8.2 + <a title="ECMAScript" href="/wiki/ECMAScript">ECMAScript</a> 5 Compliance
                        </td>
                        <td>
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            9
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>

			</asp:TextBox>
		<wijmo:C1EditorExtender ID="EditorExtender1" runat="server" TargetControlID="TextBox1" />

	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The <strong>C1EditorExtender</strong> display an editor on ASPX page.</p>

	<p>This intuitive
		Microsoft Word-like editor allows you to edit in your preferred style: design,
		code, or split view.</p>
</asp:Content>
