//-----------------------------------------------------------------------
//
//  Microsoft Windows Client Platform
//  Copyright (C) Microsoft Corporation
//
//  File:      TextLexicalBreaks.cs
//
//  Contents:  Class abstraction of lexical breaks generated by the lexical 
//             service component.
//
//  Created:   6-13-2005 Worachai Chaoweeraprasit (wchao)
//
//------------------------------------------------------------------------


using System;
using System.Globalization;
using MS.Internal.PresentationCore;


namespace System.Windows.Media.TextFormatting
{
    /// <summary>
    /// Object encapsulating the lexical breaks of text produced by the lexical services
    /// component. TextFormatter uses this info to determine proper line-breaking position
    /// 
    /// TextFormatter may also decide to cache this info for better text formatting 
    /// performance on repeated query of the same character index.
    /// </summary>
#if HYPHENATION_API
    public abstract class TextLexicalBreaks
#else
    [FriendAccessAllowed]   // used by Framework
    internal abstract class TextLexicalBreaks
#endif
    {
        /// <summary>
        /// TextFormatter to query the number of characters represented by this break object
        /// </summary>
        public abstract int Length { get; }


        /// <summary>
        /// TextFormatter to get the break position after the character identified by the cha----r index.
        /// </summary>
        /// <remarks>A break after the speicfied character is identified by the index of that character plus one.</remarks>
        /// <param name="currentIndex">current character index</param>
        /// <returns>character index of the next break. Returning negative index if no break is found.</returns>
        public abstract int GetNextBreak(int currentIndex);


        /// <summary>
        /// TextFormatter to get the break position before the character identified by the cha----r index.
        /// </summary>
        /// <remarks>A break before the speicfied character is identified by the index of that character.</remarks>
        /// <param name="currentIndex">current character index</param>
        /// <returns>character index of the previous break. Returning negative index if no break is found.</returns>
        public abstract int GetPreviousBreak(int currentIndex);
    }
}

