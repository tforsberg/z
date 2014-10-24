'***
'* ControlChars.vb
'*
'*  Copyright (c) Microsoft Corporation.  All rights reserved.
'*  Information Contained Herein Is Proprietary and Confidential.
'*
'* Purpose:
'*  Contants for the Control Characters
'*
'*****************************************************************************/

Namespace Microsoft.VisualBasic

    Public NotInheritable Class ControlChars

        Public Const CrLf As String = ChrW(13) & ChrW(10)
        Public Const NewLine As String = ChrW(13) & ChrW(10)
        Public Const Cr As Char = ChrW(13)
        Public Const Lf As Char = ChrW(10)
        Public Const Back As Char = ChrW(8)
        Public Const FormFeed As Char = ChrW(12)
        Public Const [Tab] As Char = ChrW(9)
        Public Const VerticalTab As Char = ChrW(11)
        Public Const NullChar As Char = ChrW(0)
        Public Const Quote As Char = ChrW(34)

    End Class

End Namespace

